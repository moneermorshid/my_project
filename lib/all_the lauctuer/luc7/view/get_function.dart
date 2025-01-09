// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '/controller/get_control.dart';
// import 'package:untitled/view/test_nav.dart';
//
// class GetFunction extends StatelessWidget {
//   GetFunction({super.key});
//
//   final c = Get.put(GetControl());
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           c.increment();
//         },
//         child: Icon(Icons.add),
//       ),
//
//       appBar: AppBar(
//         title: Text("hello".tr),
//       ),
//       body: GetBuilder<GetControl>(
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
//                       Get.locale == null?
//                       Locale("ar"):Get.locale == Locale("ar")?
//                       Locale("en"):
//                       Locale("ar"),
//                   );
//                 } ,
//                     child: Text("change_lang".tr),
//                 ),
//                 ElevatedButton(onPressed: (){
//                     Get.toNamed("nav");
//                 } , child: Text("move".tr)),
//                 ElevatedButton(onPressed: (){
//                   Get.snackbar("title".tr, "message".trParams(
//                     {
//                       "name":"يوسف"
//                     }
//                   ),
//                   snackPosition: SnackPosition.BOTTOM
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
//       ),
//     );
//   }
// }
