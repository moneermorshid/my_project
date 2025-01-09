import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  List cars = [];  // قائمة السيارات التي سيتم عرضها

  // دالة لاستدعاء البيانات من API
  Future<void> fetchCars() async {
    final response = await http.get(Uri.parse("http://192.168.0.60/project/project_of_cars/cars.php"));  // استبدل بالرابط الصحيح

    if (response.statusCode == 200) {
      setState(() {
        cars = json.decode(response.body);  // تحويل البيانات المستلمة إلى قائمة
      });
    } else {
      throw Exception('Failed to load cars');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCars(); // استدعاء البيانات عند تحميل الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Sales'),
      ),
      body: cars.isEmpty
          ? Center(child: CircularProgressIndicator())  // عرض مؤشر التحميل أثناء جلب البيانات
          : ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          var car = cars[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('${car['brand']} ${car['model']}'),
              subtitle: Text('Price: \$${car['price']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // يمكنك إضافة صفحة التفاصيل هنا عند النقر على السيارة
              },
            ),
          );
        },
      ),
    );
  }
}
