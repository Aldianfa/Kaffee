import 'package:dataramen/view/dashboard.dart';
import 'package:dataramen/view/login.dart';
import 'package:dataramen/view/register.dart';
import 'package:dataramen/view/menu.dart';
import 'package:dio/dio.dart';
import'package:flutter/material.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      theme: ThemeData(
        fontFamily : 'Poppins'
      ),
      home: Login(),
    );
  }
}
