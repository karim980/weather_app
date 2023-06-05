import 'package:dio/dio.dart';

//http://api.weatherapi.com/v1/current.json?key=41685d2dc63447cf803154920230206&q=cairo&aqi=no


class DioHelper{

  static Dio dio=Dio(
      BaseOptions(
          baseUrl: 'http://api.weatherapi.com/',
          receiveDataWhenStatusError: true
      )
  );

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,

  })async{
    return await dio.get(url,queryParameters: query,);
  }
}