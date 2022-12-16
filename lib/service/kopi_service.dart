import 'package:dataramen/models/kopi.dart';
import 'package:dio/dio.dart';

class service{
  static Future<List<Kopi>> fetchKopi() async{
    Response response = await Dio().get('http://172.20.10.6:3000/kopi');
    List<Kopi> kopies = (response.data as List).map((v) => Kopi.fromJson(v)).toList();
    return kopies; 
  }
  // static Future<List<Kopi>> fetchKopiDes(String s) async{
  //   Response response = await Dio().get('http://172.20.10.6:3000/kopi?des');
  //   List<Kopi> kopies = (response.data as List).map((v) => Kopi.fromJson(v)).toList();
  //   return kopies; 
  // }
}