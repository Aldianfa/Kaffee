// import 'dart:convert';
// // import 'dart:html';

// import 'package:flutter/material.dart';

// // import '../service/ramene_service.dart';
// import '../service/Ramene.dart';
// import 'package:http/http.dart' as http;


// class bebas extends StatefulWidget {
//   const bebas({Key? key}) : super(key: key);

//   @override
//   State<bebas> createState() => _bebasState();
// }

// class _bebasState extends State<bebas> {

//   List<Ramene> _ramen = List<Ramene>();

//   Future<List<Ramene>> fetchNotes() async{
//     var url = 'https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json';
//     var response = await http.get(Uri.parse(url));


//     var ramen = List<Ramene>();


//     if (response.statusCode == 200){
//       var rameneJson = json.decode(response.body);
//       for (var ramenJson in rameneJson){
//         ramen.add(Ramene.fromJson(ramenJson));
//       }

//     }
//     return ramen;
//   }

//   void initState(){
//     fetchNotes().then((value) {
//       setState(() {
//         _ramen.addAll(value);
//       });
//     });
//     super.initState();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(itemBuilder: (context, index)
//       {
//         return Card(
//           child: Padding(padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, right: 32.0, left: 32.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(_ramen[index].product_name),
//               Text(_ramen[index].description),
//               Image.network(_ramen[index].img_url)

//             ],
//           ),
//           \)
//         );
//       },
//       itemCount: _ramen.length,
//       ),
//     );
//   }
// }