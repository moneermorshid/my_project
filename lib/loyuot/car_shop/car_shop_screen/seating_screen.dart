import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/get_control.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/get_control.dart';

class SeatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GetControl c = Get.find<GetControl>();
    return GetBuilder<GetControl>(
      builder: (control) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('Account'.tr,style: TextStyle(fontSize:17,),),
                      ],
                    ),
                    Card(
                      child: ListTile(
                        horizontalTitleGap: 15,
                        title: Text('Moneer'),
                        leading:SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            foregroundImage: NetworkImage('https://th.bing.com/th/id/OIP.PZsMLTIgXaEsdCA0VjTo7gHaLH?rs=1&pid=ImgDetMain'),
                          ),
                        ),
                       trailing: TextButton(
                           onPressed: (){
                             print('Moneer Hameed ');
                           }, child:Text('Edit'.tr,style: TextStyle(color: Colors.blue,fontSize: 15),)),
                       subtitle: Text('monyrhmyd45@gmail.com'),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('App'.tr,style: TextStyle(fontSize:17,),),
                      ],
                    ),
                    Card(
                      // color: Colors.white,
                      child:Column(
                        children: [
                          TheameButton(
                            icon: Icons.language,
                            arrow:Icons.arrow_forward_ios,
                            text:'ChangeLanguage'.tr,
                            function: (){
                              // var locale = Get.locale == Locale('ar') ? Locale('en') : Locale('ar');
                              // Get.updateLocale(locale);
                            },
                          ),
                          Divider(
                            indent: 50,
                          ),
                          TheameButton(
                            icon: Icons.light_mode,
                            arrow:Icons.arrow_forward_ios,
                            text:'ChangeTheme'.tr,
                            function: (){
                              Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                            },
                          ),
                          Divider(
                            indent: 50,
                          ),
                          TheameButton(
                            icon: Icons.map,
                            arrow:Icons.arrow_forward_ios,
                            text:'MapProvider'.tr,
                            function: (){
                              Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                            },
                          ),
                          Divider(
                            indent: 50,
                          ),
                          TheameButton(
                            icon: Icons.subscriptions,
                            arrow:Icons.arrow_forward_ios,
                            text:'Subscriptions'.tr,
                            function: (){
                              Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('Speech'.tr,style: TextStyle(fontSize:17,),),
                      ],
                    ),
                    Card(
                      // color: Colors.white,
                      child:Column(
                        children: [
                          TheameButton(
                            icon: Icons.language,
                            arrow:Icons.arrow_forward_ios,
                            text:'MainLanguage'.tr,
                            function: (){
                              var locale = Get.locale == Locale('ar') ? Locale('en') : Locale('ar');
                              Get.updateLocale(locale);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('About'.tr,style: TextStyle(fontSize:17,),),
                      ],
                    ),
                    Card(
                      child:Column(
                        children: [
                          TheameButton(
                            icon: Icons.help,
                            arrow:Icons.arrow_forward_ios,
                            text:'HelpCenter'.tr,
                            function: (){

                            },
                          ),
                          Divider(
                            indent: 50,
                          ),
                          TheameButton(
                            icon: Icons.article,
                            arrow:Icons.arrow_forward_ios,
                            text:'TermsOfUse'.tr,
                            function: (){
                            },
                          ),
                          Divider(
                            indent: 50,
                          ),
                          TheameButton(
                            icon: Icons.lock_outline,
                            arrow:Icons.arrow_forward_ios,
                            text:'PrivacyPolicy'.tr,
                            function: (){
                              Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Card(
                      // color: Colors.white,
                      child:Column(
                        children: [
                          TheameButton(
                            icon: Icons.logout_outlined,
                            arrow:Icons.arrow_forward_ios,
                            text:'LogOut'.tr,
                            function: (){
                              var locale = Get.locale == Locale('ar') ? Locale('en') : Locale('ar');
                              Get.updateLocale(locale);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget TheameButton({
    required String text,
    required dynamic icon,
    required IconData arrow,
    required var function,

})=>Column(
    children: [
      SizedBox(height: 10,),
      InkWell(
        onTap:function,
        child: Row(children: [
          SizedBox(width: 10,),
          Icon(icon,size: 30),
          SizedBox(width: 10,),
          SizedBox(width:230,
            child:Text(text,style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),),
          SizedBox(width:50,),
          IconButton(onPressed: (){}, icon:Icon(arrow,size: 20,)),
        ],),
      ),
    ],
  );
}

