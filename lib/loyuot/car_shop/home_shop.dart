import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_control.dart';
import 'car_shop_screen/cateogries_screen.dart';
import 'car_shop_screen/home_screen.dart';
import 'car_shop_screen/favorite_screen.dart';
import 'car_shop_screen/seating_screen.dart';


class HomeShop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GetControl c = Get.find<GetControl>();
    return GetBuilder<GetControl>(
      builder:(control){
        return  Scaffold(
          body:c.bottomScreens[c.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor:Colors.black,
              selectedItemColor:Colors.blue,
              showSelectedLabels: true,
              useLegacyColorScheme: true,
              iconSize: 30,
              onTap: (index)
              {
              c.screenChange(index);
              },
              currentIndex:c.currentIndex,
              items:[
                BottomNavigationBarItem(
                    icon:Icon(Icons.home),
                    label: "home".tr),
                BottomNavigationBarItem(
                    icon:Icon(Icons.apps),
                    label: 'Categories'.tr),
                BottomNavigationBarItem(
                    icon:Icon(Icons.favorite),
                    label:"Favorite".tr),
                BottomNavigationBarItem(
                    icon:Icon(Icons.settings),
                    label: "Settings".tr),
              ]),
        );
      },
    );
  }
}
//
// final c = Get.put(GetControl());
// @override
// Widget build(BuildContext context) {
//
//   return Scaffold(
//     floatingActionButton: FloatingActionButton(
//       onPressed: (){
//         c.increment();
//       },
//       child: Icon(Icons.add),
//     ),
//
//     appBar: AppBar(
//       title: Text("hello".tr),
//     ),
//     body: GetBuilder<GetControl>(
//         builder: (control) {
//           return SizedBox(
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(control.counter.toString(), style: TextStyle(
//                   fontSize: 30.0,
//                 ),
//                 ),
//                 ElevatedButton(onPressed: (){
//                   Get.updateLocale(
//                     Get.locale == null?
//                     Locale("ar"):Get.locale == Locale("ar")?
//                     Locale("en"):
//                     Locale("ar"),
//                   );
//                 } ,
//                   child: Text("change_lang".tr),
//                 ),
//                 ElevatedButton(onPressed: (){
//                   Get.toNamed("nav");
//                 } , child: Text("move".tr)),
//                 ElevatedButton(onPressed: (){
//                   Get.snackbar("title".tr, "message".trParams(
//                       {
//                         "name":"يوسف"
//                       }
//                   ),
//                       snackPosition: SnackPosition.BOTTOM
//                   );
//                 } , child: Text("show_snack".tr)),
//                 ElevatedButton(onPressed: (){
//                   Get.defaultDialog(content: Text("message".trParams(
//                       {
//                         "name":"يوسف"
//                       }
//                   )));
//                 } , child: Text("show_dialog".tr)),
//
//                 ElevatedButton(onPressed: (){
//                   Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
//                 } , child: Text("change_theme".tr)),
//               ],
//             ),
//           );
//         }
//     ),
//   );
//
// class HomeShop extends StatefulWidget {
//   const HomeShop({super.key});
//
//   @override
//   State<HomeShop> createState() => _HomeShopState();
// }
//
// class _HomeShopState extends State<HomeShop> {
//
//   int currentIndex=0;
//   List<Widget> bottomScreens=[
//     FivoretisScreen(),
//     CateogriesScreen(),
//     SalesProdict(),
//     SeatingScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//       ),
//       body:bottomScreens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           unselectedItemColor:Colors.black,
//           selectedItemColor:Colors.blue,
//           showSelectedLabels: true,
//           useLegacyColorScheme: true,
//           iconSize: 30,
//           onTap: (index)
//           {
//             setState(() {
//               currentIndex=index;
//             });
//           },
//           currentIndex:currentIndex,
//           items:[
//             BottomNavigationBarItem(
//                 icon:Icon(Icons.home),
//                 label: 'Home'),
//             BottomNavigationBarItem(
//                 icon:Icon(Icons.apps),
//                 label: 'Cateogries'),
//             BottomNavigationBarItem(
//                 icon:Icon(Icons.favorite),
//                 label: 'Favorite'),
//             BottomNavigationBarItem(
//                 icon:Icon(Icons.settings),
//                 label: 'Settings'),
//           ]),
//     );
//   }
// }
