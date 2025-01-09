import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mysqlflutter/loyuot/home_screen.dart';

import '../loyuot/car_shop/car_shop_screen/cateogries_screen.dart';
import '../loyuot/car_shop/car_shop_screen/home_screen.dart';
import '../loyuot/car_shop/car_shop_screen/favorite_screen.dart';
import '../loyuot/car_shop/car_shop_screen/seating_screen.dart';
class GetControl extends GetxController{
  int currentIndex=0;
  List<Widget> bottomScreens=[
    HomeScreenProdect(),
    CateogriesScreen(),
    FavoriteScreen(),
    SeatingScreen()
  ];
  screenChange(int index){
    currentIndex = index;
    update();
  }
}