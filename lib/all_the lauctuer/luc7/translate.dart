import 'package:get/get.dart';

class Message extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "en":{
      "hello": "Hello Man",
      "change_lang": "Change Language",
      "move":"Move to Anther Screen",
      "show_snack":"Show Snack Bar",
      "title": "Notification",
      "message":"Welcome user @name",
      "show_dialog":"Show Dialog",
      "change_theme":"Change Theme"
    },
    "ar":{
      "hello": "مرحبا!!",
      "change_lang":"تغير اللغة",
      "move": "انتقال الى شاشة اخرى",
      "show_snack":"عرض اشعار",
      "title":"اشعار!",
      "message":"مرحبا بك @name",
      "show_dialog":"عرض نموذج",
      "change_theme":"تغير السمة"
    }
  };

}