import 'package:flutter/material.dart';
import 'package:weather_app/core/app_theme.dart';
import 'package:weather_app/data/helper.dart';
import 'package:weather_app/presentation/home.dart';


void main() {
  DioHelper.dio;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: appTheme,
      );
  }
}
