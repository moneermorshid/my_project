import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExsersScreen extends StatefulWidget {
  const ExsersScreen({super.key});

  @override
  State<ExsersScreen> createState() => _ExsersScreenState();
}

class _ExsersScreenState extends State<ExsersScreen> {
  List<Map<String, dynamic>> list = [];

  Future readData() async {
    var url = "http://192.168.0.60/project/project_of_cars/readDataCars.php";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);
      setState(() {
        list = List<Map<String, dynamic>>.from(red); // تأكد من تحويل البيانات إلى النوع الصحيح
      });
    }
    print(list);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.6,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  list.length, // هنا تم استخدام طول القائمة
                      (index) => buildGridProduct(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridProduct(int index) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.network(
              '${list[index]['image']}',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                'DISCOUNT',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${list[index]['description']}',
                style: TextStyle(fontSize: 15, height: 1.3, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${list[index]['description']}',
                    style: TextStyle(fontSize: 15, height: 1.3, fontWeight: FontWeight.bold, color: Colors.blue),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${list[index]['price']}',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      // ShopCubit.get(context).changeFavorites(model.id!);
                      // print('the key of products ${model.id!}');
                    },
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.favorite_border, size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
