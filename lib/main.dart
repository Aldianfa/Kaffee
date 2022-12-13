
import 'package:dataramen/view/add_kopi.dart';
import 'package:dataramen/view/dashboardd.dart';
import 'package:dataramen/view/home.dart';

import 'package:dataramen/view/menu.dart';
import 'package:dataramen/view/news_kopi.dart';
import 'package:dataramen/view/registerr.dart';
import 'package:dataramen/view/splashscreen.dart';
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
      home: Splashscreen(),
    );
  }
}
