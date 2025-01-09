import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List list=[];
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail= TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerAge = TextEditingController();

  // -------------- get image from phone -------------------
  XFile? img;
  ImagePicker imgpic = ImagePicker();
  getImg(id)async{
    final pic = await imgpic.pickImage(source: ImageSource.gallery);
    setState(() {
      img = XFile(pic!.path);
    });
    addImage(id);
  }
  // --------------UploadImage -------------------
  Future UploadImage(id)async{
    var url ="http://192.168.0.60/project/fun/uploadimage.php";
    var req=http.MultipartRequest("post",Uri.parse(url));
    req.fields['id']= id;
    var pic = await http.MultipartFile.fromPath('img',img!.path);
    req.files.add(pic);
    var res = await req.send();
    if(res.statusCode == 200){
      print('DDDDDDDDDDone');
    }

  }
  // -------------- readData -------------------
  Future readData()async{
    var url ="http://192.168.0.60/project/fun/readData.php";
    var res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      var red = jsonDecode(res.body);
      setState(() {
        list.addAll(red);
      });
    }
    print(list);
  }
  // --------------addData -------------------
  Future addData() async {
    var url = "http://192.168.0.60/project/fun/addData.php";

    try {
      var res = await http.post(
        Uri.parse(url),
        body: {
          "username": controllerName.text,
          "emai": controllerEmail.text,
          "password": controllerPassword.text,
          "age": controllerAge.text, // إرسال العمر
        },
      );

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        setState(() {
          list.add({
            'username': controllerName.text,
            'emai': controllerEmail.text,
            'password': controllerPassword.text,
            'age': controllerAge.text,
          });
        });
        if (response['status'] == 'success') {

          print("User added successfully: ${response['message']}");
        } else {
          print("Failed to add user: ${response['message']}");
        }
      } else {
        print("Error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error adding data: $e");
    }
  }
  // --------------addData -------------------
  Future editData(id) async {
    var url = "http://192.168.0.60/project/fun/editData.php";

    try {
      var res = await http.post(Uri.parse(url), body: {
        "id":id,
        "username": controllerName.text,
        "emai": controllerEmail.text,
        "password": controllerPassword.text,
        "age": controllerAge.text,
      });

      print("Response status: ${res.statusCode}");
      print("Response body: ${res.body}");

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        // تابع معالجة الرد هنا
      } else {
        print("Server returned an error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  // --------------deleteData -------------------
Future deleteData(id)async{
    var url="http://192.168.0.60/project/fun/deleteData.php";
    var res= await http.post(Uri.parse(url),body: {
      "id":id,
    });
    if (res.statusCode == 200) {
      var response = jsonDecode(res.body);
      setState(() {
        list.removeWhere((element) => element['userid'] == id);
      });
      print(response);
      // تابع معالجة الرد هنا
    } else {
      print("Server returned an error: ${res.statusCode}");
    }
}
  // --------------addImage -------------------
addImage(id){
    showDialog(
        context: context,
        builder:(context){
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: (){
                      UploadImage(id);
                      Navigator.pop(context);
                    },
                    child:Text('Upload')),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:Text('Cancel')),
              ],
            ),
          );
        });
}
  addUsers() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 400,
            width: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerPassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerAge,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    addData();
                    Navigator.of(context).pop(); // إغلاق النافذة
                  },
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  editUsers(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 400,
            width: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerPassword,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controllerAge,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                   editData(id);
                    Navigator.of(context).pop(); // إغلاق النافذة
                  },
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future deleteUser(String id) async {
    var url = "http://192.168.8.7/project/fun/delete.php";
    var res = await http.post(
      Uri.parse(url),
      body: {"id": id.toString()},
    );
    if (res.statusCode == 200) {
      setState(() {
        list.removeWhere((element) => element['userid'] == id); // تحديث القائمة.
      });
      print("User with id $id deleted successfully");
    } else {
      print("Failed to delete user with id $id");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()async{
    await readData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text(' mysqlApp',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),) ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){
              addUsers();
            }, icon:Icon(Icons.add,size: 30,color: Colors.white,)),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder:(context,index){
            return ListTile(
              title: Text(list[index]['username']),
              subtitle: Text(list[index]['emai']),
              leading: InkWell(
                onTap: (){
                  getImg(list[index]['userid']);
                },
                child: CircleAvatar(
                  radius: 20,
                  foregroundImage:list[index]['image']== null ? null: NetworkImage("http://192.168.0.60/project/img/${list[index]['image']}"),
                  backgroundColor: Colors.grey,
                  child: Text(list[index]['username'].toString().substring(0,1).toUpperCase()),
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      editUsers(list[index]['userid']);
                    }, icon:Icon(Icons.edit,color: Colors.blue,),),
                    IconButton(onPressed: (){
                      deleteData(list[index]['userid']);
                    }, icon:Icon(Icons.delete,color: Colors.red,),),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
