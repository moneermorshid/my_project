import 'package:get/get.dart';
class GetControl extends GetxController{
  int counter = 0;
  increment(){
    counter++;
    update();
  }
}