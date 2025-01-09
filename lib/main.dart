import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysqlflutter/transaltion/translate.dart';
import 'controller/get_control.dart';
import 'database_mysql/mysql.dart';
import 'loyuot/car_shop/home_shop.dart';
import 'loyuot/cars_screen.dart';
import 'loyuot/class_screen.dart';
import 'loyuot/exsers_screen.dart';
import 'loyuot/home_screen.dart';
void main()async {


  WidgetsFlutterBinding.ensureInitialized();
  Get.put(GetControl());
  // Get.lazyPut(() => GetControl());
  // await MySqlDb.connDB();
  // Map<String,dynamic> data={
  //   "username":"moneer",
  //   "emai":"shoiep@gmail",
  //   "password":"0000",
  //   "age":"18",
  //
  // };
  // await MySqlDb.insert("user",data);
  // await MySqlDb.delete("user", 6);
  // Map<String, dynamic> user = {
  //
  //   "password": "11111"
  // };
  // await MySqlDb.update("users", user, 1);
  // print(await MySqlDb.query('user'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      translations: Message(),
      locale: Locale("en"),
      theme:ThemeData.light(),
      darkTheme: ThemeData.dark(useMaterial3:false
      ),
      themeMode: ThemeMode.light,
      home:HomeShop(),
    );
  }
}