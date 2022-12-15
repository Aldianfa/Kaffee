import 'package:flutter/material.dart';

import '../view/chart.dart';
import '../view/chart.dart';

class TabsController extends StatelessWidget {
  // final UserModel user;
  
  var Tab1, Tab2, Tab3;
  TabsController(
      {required this.Tab1,
      required this.Tab2,
      required this.Tab3,
      });
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      body : 
      DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 249, 0, 0),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Game News',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'Poppins Bold',
                fontSize: 20,
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'ALL',
                ),
                Tab(
                  text: 'Coffee',
                ),
                Tab(
                  text: 'Non Coffee',
                ),
                
              ],
            ),
          ),
          
          body: TabBarView(
            children: <Widget>[Tab1, Tab2, Tab3],
          ),
          // bottomNavigationBar: Controller(),
          // bottomNavigationBar: Butnov(onTabChange: null,),
        ),
      ),
    );
  }
}