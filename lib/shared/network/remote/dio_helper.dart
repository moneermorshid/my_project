import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){

    dio=Dio(
      BaseOptions(
        // 'https://newsapi.org/',
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang ='ar',
    String? token,
})async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'token':token??'',
    };
    return await dio.get(
      url,
      queryParameters:query,
    );
  }
  static Future<Response> postData({
    required String url,
     Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='ar',
    String? token,
})async
   {
     //zRdi1bxCfagbNxVJmiXx2seV32guo0zTGTl46WaXeswObmfoJ0xkxpIdvWAVYfUsfHpgaJ
     dio.options.headers = {
         'lang':lang,
         'Content-Type':'application/json',
         'Authorization':token ,
       };
     return dio.post(
       url,
       queryParameters: query,
       data: data,

     );
   }
}