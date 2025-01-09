import 'package:flutter/material.dart';
import '../database_mysql/mysql.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  List<Map<String, dynamic>> users = []; // قائمة لتخزين البيانات من قاعدة البيانات

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await MySqlDb.connDB(); // الاتصال بقاعدة البيانات
    await _fetchUsers(); // جلب البيانات
  }

  Future<void> _fetchUsers() async {
    List data = await MySqlDb.query("user"); // استعلام البيانات من جدول "users"
    setState(() {
      users = List<Map<String, dynamic>>.from(data); // تخزين البيانات في القائمة
    });
  }

  Future<void> _deleteUser(int id) async {
    await MySqlDb.delete("user", id);
    await _fetchUsers(); // تحديث القائمة بعد الحذف
  }

  Future<void> _addUser() async {
    Map<String, dynamic> newUser = {
      "username": "moneer",
      "password": "123456",
    };
    await MySqlDb.insert("user", newUser);
    await _fetchUsers(); // تحديث القائمة بعد الإضافة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'mysqlApp',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                _addUser(); // إضافة مستخدم جديد عند الضغط على الزر
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length, // عدد العناصر في القائمة
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['username'] ?? 'No Name'), // اسم المستخدم
            subtitle: Text(users[index]['password'] ?? 'No Password'), // كلمة المرور
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Text(
                users[index]['username']?.substring(0, 1).toUpperCase() ?? 'N',
              ),
            ),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // إضافة منطق تعديل المستخدم هنا
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _deleteUser(users[index]['userid']); // حذف المستخدم
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
