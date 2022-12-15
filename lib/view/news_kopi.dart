import 'package:flutter/material.dart';

import 'add_kopi.dart';
import 'chart.dart';
import 'dashboardd.dart';
import 'home.dart';

class NewsKopi extends StatefulWidget {
  const NewsKopi({Key? key}) : super(key: key);

  @override
  State<NewsKopi> createState() => _NewsKopiState();
}

class _NewsKopiState extends State<NewsKopi> {
  
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
          'News Kaffee',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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