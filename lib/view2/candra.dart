// import 'package:dataramen/models/kopi.dart';
// import 'package:dataramen/service/kopi_service.dart';
// import 'package:dataramen/view2/TabsController.dart';
// import 'package:dataramen/view/detail.dart';
// import 'package:flutter/material.dart';

// class HomeTab extends StatefulWidget {
//   // final UserModel user;
  
//   HomeTab({Key? key}) : super(key: key);

//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> {
//   int _currentIndex = 0;
//   var lastIndex;

//   @override
//   Widget build(BuildContext context) {
    
//     Widget tabSemua = FutureBuilder<List<Kopi>>(
//                 future: service.fetchKopi(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState==ConnectionState.waiting){
//                     return Center(child: CircularProgressIndicator());
      
//                   }else{
//                     if (snapshot.hasError){
//                       return Text(snapshot.error.toString());
//                     }else{
//                       return ListView.separated(
                        
//                 itemCount: snapshot.data!.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, 
//                       MaterialPageRoute(builder: (context) => Detailkopi(kopi: Kopi(id: int.parse("${snapshot.data?[index].id}"), name: "${snapshot.data?[index].name}", price: "${snapshot.data?[index].price}", description: "${snapshot.data?[index].description}", image: "${snapshot.data?[index].image}", rate: int.parse("${snapshot.data?[index].rate}"), des: "${snapshot.data?[index].des}"),)));
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)
                        
//                       ),
//                       child: Container(
                       
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 0, right: 10, left: 0),
//                                 child: Container(
//                                   height: 120,
//                                   width: 100,
//                                   // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
//                                   decoration: BoxDecoration(
//                                     // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: NetworkImage(snapshot.data![index].image),
//                                       fit: BoxFit.cover
//                                     )
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(bottom: 5,top: 5),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
                                      
//                                       Text(snapshot.data![index].name, style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
      
//                                       SizedBox(height: 2,),
//                                       Text(snapshot.data![index].des,style: TextStyle(fontSize: 11, color: Colors.grey),),
//                                       SizedBox(height: 30,),
//                                       Text(snapshot.data![index].price.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),)
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,) ;},
                
//               );
//                     }
//                   }
//                 },
//               );

//     Widget tabCoffee = FutureBuilder<List<Kopi>>(
//       future: service.fetchKopiDes("Coffee Based"),
//       builder: (context, snapshot) {
//                   if (snapshot.connectionState==ConnectionState.waiting){
//                     return Center(child: CircularProgressIndicator());
      
//                   }else{
//                     if (snapshot.hasError){
//                       return Text(snapshot.error.toString());
//                     }else{
//                       return ListView.separated(
                        
//                 itemCount: snapshot.data!.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, 
//                       MaterialPageRoute(builder: (context) => Detailkopi(kopi: Kopi(id: int.parse("${snapshot.data?[index].id}"), name: "${snapshot.data?[index].name}", price: "${snapshot.data?[index].price}", description: "${snapshot.data?[index].description}", image: "${snapshot.data?[index].image}", rate: int.parse("${snapshot.data?[index].rate}"), des: "${snapshot.data?[index].des}"),)));
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)
                        
//                       ),
//                       child: Container(
                       
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 0, right: 10, left: 0),
//                                 child: Container(
//                                   height: 120,
//                                   width: 100,
//                                   // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
//                                   decoration: BoxDecoration(
//                                     // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: NetworkImage(snapshot.data![index].image),
//                                       fit: BoxFit.cover
//                                     )
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(bottom: 5,top: 5),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
                                      
//                                       Text(snapshot.data![index].name, style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
      
//                                       SizedBox(height: 2,),
//                                       Text(snapshot.data![index].des,style: TextStyle(fontSize: 11, color: Colors.grey),),
//                                       SizedBox(height: 30,),
//                                       Text(snapshot.data![index].price.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),)
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,) ;},
                
//               );
//                     }
//                   }
//                 },
//     );

//     Widget tabNon = FutureBuilder<List<Kopi>>(
//       future: service.fetchKopiDes("Non Coffee Based"),
//       builder: (context, snapshot) {
//                   if (snapshot.connectionState==ConnectionState.waiting){
//                     return Center(child: CircularProgressIndicator());
      
//                   }else{
//                     if (snapshot.hasError){
//                       return Text(snapshot.error.toString());
//                     }else{
//                       return ListView.separated(
                        
//                 itemCount: snapshot.data!.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, 
//                       MaterialPageRoute(builder: (context) => Detailkopi(kopi: Kopi(id: int.parse("${snapshot.data?[index].id}"), name: "${snapshot.data?[index].name}", price: "${snapshot.data?[index].price}", description: "${snapshot.data?[index].description}", image: "${snapshot.data?[index].image}", rate: int.parse("${snapshot.data?[index].rate}"), des: "${snapshot.data?[index].des}"),)));
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)
                        
//                       ),
//                       child: Container(
                       
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 0, right: 10, left: 0),
//                                 child: Container(
//                                   height: 120,
//                                   width: 100,
//                                   // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
//                                   decoration: BoxDecoration(
//                                     // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
//                                     borderRadius: BorderRadius.circular(20),
//                                     image: DecorationImage(
//                                       image: NetworkImage(snapshot.data![index].image),
//                                       fit: BoxFit.cover
//                                     )
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(bottom: 5,top: 5),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
                                      
//                                       Text(snapshot.data![index].name, style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
      
//                                       SizedBox(height: 2,),
//                                       Text(snapshot.data![index].des,style: TextStyle(fontSize: 11, color: Colors.grey),),
//                                       SizedBox(height: 30,),
//                                       Text(snapshot.data![index].price.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),)
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,) ;},
                
//               );
//                     }
//                   }
//                 },
//     );

    

//     return TabsController(
//       Tab1: tabSemua,
//       Tab2: tabCoffee,
//       Tab3: tabNon,
      
      
//     );
//   }
// }