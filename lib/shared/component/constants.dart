//
//
// import 'package:flutter/material.dart';
// import '../../loyuot/login/login_screen.dart';
// import '../network/local/cache_helper.dart';
//
// void signOut(context){
//   CacheHelper.removeData(
//     key: 'token',).then((value){
//     Navigator.pushAndRemoveUntil(
//       context,MaterialPageRoute(builder: (context)=>ShopLoginScreen()),
//           (route)=>false,);
//   });
// }
// void printFullText(String text){
//   final pattern = RegExp('.{1,800}');
//   pattern.allMatches(text).forEach((match)=>print(match.group(0)));
// }
//
// String token='';