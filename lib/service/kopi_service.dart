import 'package:dataramen/models/kopi.dart';
import 'package:dio/dio.dart';

class service{
  static Future<List<Kopi>> fetchKopi() async{
    Response response = await Dio().get('http://192.168.18.69:3000/kopi');
    List<Kopi> kopies = (response.data as List).map((v) => Kopi.fromJson(v)).toList();
    return kopies; 
  }
}