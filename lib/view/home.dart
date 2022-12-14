

import 'package:dataramen/models/kopi.dart';
import 'package:dataramen/service/kopi_service.dart';
import 'package:dataramen/view/add_kopi.dart';
import 'package:dataramen/view/chart.dart';
import 'package:dataramen/view/dashboardd.dart';
import 'package:dataramen/view/detail.dart';
import 'package:dataramen/view/loginn.dart';
import 'package:dataramen/view/news_kopi.dart';
import 'package:flutter/material.dart';


class Home_page extends StatefulWidget {
  const Home_page();

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 91, 60),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 172, 145, 101)),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Kaffee',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 172, 145, 101),
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: new Icon(Icons.shopping_bag_rounded),
            color: Color.fromARGB(255, 172, 145, 101),
            onPressed: () {
              print('Keranjang');
              Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => Chart()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(  
          margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Lets take your coffee, \n Folks!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                        size: 28,
                      ),
                      hintText: "Search your Coffee",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
              
              SizedBox(height: 10,),

              Card(
              semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/img/Layer.png',fit:BoxFit.fill,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
            ),
            SizedBox(height: 10,),
            Text('Menu :',textAlign: TextAlign.start, style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18
            ),),
            FutureBuilder<List<Kopi>>(
              future: service.fetchKopi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                          
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              
                              onTap: () {
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> Detailkopi(kopi: Kopi(id: int.parse("${snapshot.data?[i].id}"), name: "${snapshot.data?[i].name}", price: "${snapshot.data?[i].price}", description: "${snapshot.data?[i].description}", image: "${snapshot.data?[i].image}", rate: int.parse("${snapshot.data?[i].rate}"), des: "${snapshot.data?[i].des}"),)));
                              },
                              
                              child: Card(
                                color: Color.fromARGB(255, 235, 236, 221),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                          child: Container(
                                          height: 120,
                                          width: 170,
                                  // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                    
                                    // borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(

                                      image: NetworkImage(snapshot.data![i].image),
                                      fit: BoxFit.cover, 
                                    )
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment : MainAxisAlignment.center,
                                    children: [
                                      
                                      
                                      Text(snapshot.data![i].name, style: TextStyle(fontSize:11,fontWeight: FontWeight.bold)),
      
                                      SizedBox(height: 2,),
                                      Text(snapshot.data![i].des, style: TextStyle(fontSize:9,fontWeight: FontWeight.bold, color: Colors.grey)),
                                      
                                
                                      
                                    ],
                                  ),
                                ),
                              )
                                    ],
                                  ),
                                ),
                              ),
                              
                                
                              
                            );
                            
                          }),
                    );
                  }
                }
              }
              )


            // INI LISTVIEW
            // SizedBox(height: 5,),
      
            //   // GridView.builder(
                
            //   // ),
            //   FutureBuilder<List<Kopi>>(
            //     future: service.fetchKopi(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState==ConnectionState.waiting){
            //         return Center(child: CircularProgressIndicator());
      
            //       }else{
            //         if (snapshot.hasError){
            //           return Text(snapshot.error.toString());
            //         }else{
            //           return ListView.separated(
                        
            //     itemCount: snapshot.data!.length,
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.push(context, 
            //           MaterialPageRoute(builder: (context) => Detailkopi(kopi: Kopi(id: int.parse("${snapshot.data?[index].id}"), name: "${snapshot.data?[index].name}", price: "${snapshot.data?[index].price}", description: "${snapshot.data?[index].description}", image: "${snapshot.data?[index].image}", rate: int.parse("${snapshot.data?[index].rate}"), des: "${snapshot.data?[index].des}"),)));
            //         },
            //         child: Card(
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20)
                        
            //           ),
            //           child: Container(
                       
            //             child: Center(
            //               child: Row(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 0, right: 10, left: 0),
            //                     child: Container(
            //                       height: 120,
            //                       width: 100,
            //                       // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
            //                       decoration: BoxDecoration(
            //                         // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
            //                         borderRadius: BorderRadius.circular(20),
            //                         image: DecorationImage(
            //                           image: NetworkImage(snapshot.data![index].image),
            //                           fit: BoxFit.cover
            //                         )
            //                       ),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(bottom: 5,top: 5),
            //                       child: Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
                                      
            //                           Text(snapshot.data![index].name, style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
      
            //                           SizedBox(height: 2,),
            //                           Text(snapshot.data![index].des,style: TextStyle(fontSize: 11, color: Colors.grey),),
            //                           SizedBox(height: 30,),
            //                           Text(snapshot.data![index].price.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),)
            //                         ],
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 5,) ;},
                
            //   );
            //         }
            //       }
            //     },
            //   )
              
            ],
          ),
        ),
      ),
      drawer: Drawer(
         
         child: ListView(
           
           padding: EdgeInsets.zero,
           children: [
             DrawerHeader(
               
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 48, 91, 60),
                //  borderRadius: BorderRadius.only(bottomLeft: 9.0, bottomRight: )
                 

               ),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                "Kaffee,",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 172, 145, 101)),
              ),
              Text(
                "For your best Coffee!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,color: Color.fromARGB(255, 172, 145, 101)),
              ),
                ],
               ),
              
             ),
             ListTile(
               leading: Icon(Icons.home,color: Color.fromARGB(255, 172, 145, 101)),
               title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
               onTap: () {
                Navigator.push(context,
                     MaterialPageRoute(builder: (context) => (Home_page()),
                     ));
               }),

             ListTile(
               leading: Icon(Icons.newspaper_rounded,color: Color.fromARGB(255, 172, 145, 101)),
               title: const Text('Coffee News', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
               onTap: () {
                 Navigator.pop(context);
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => (NewsKopi()),
                     ));
               },
             ),
             ListTile(
               leading: Icon(Icons.coffee_rounded,color: Color.fromARGB(255, 172, 145, 101)),
               title: const Text('Add Coffee', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
                 onTap: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context) => (AddKopi()),
                   ));
                 }
             ),
             new Divider(),
             SizedBox(height: 290,),
             ListTile(
               leading: Icon(Icons.exit_to_app,color: Color.fromARGB(255, 172, 145, 101)),
               trailing: new Icon(Icons.cancel,),
                title: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
               onTap: () {
                 Navigator.pop(context);
                 Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) => (dashboardd()),
                     ));
               },
             ),
           ],
         ),
       ),
    );
    
  } 
}
