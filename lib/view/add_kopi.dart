import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'chart.dart';
import 'dashboardd.dart';
import 'home.dart';
import 'loginn.dart';
import 'news_kopi.dart';

class AddKopi extends StatefulWidget {
  const AddKopi({Key? key}) : super(key: key);

  @override
  State<AddKopi> createState() => _AddKopiState();
}

class _AddKopiState extends State<AddKopi> {

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerRate = TextEditingController();
  TextEditingController controllerDes = TextEditingController();

  


  // method register 
  void add(String name, price, description, image, des, int rate) async {
    try {
      // ME-POST atau MENAMBAH data json dari link 
      var response = await Dio().post('http://192.168.100.57:3000/kopi',
          data: {
            "name": name,
            "price": price,
            "description": description,
            "image": image,
            "rate": rate,
            "des": des 
          });
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Coffee Added successfully");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AddKopi(),));
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Added failed',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print("Added Failed");
      }
    } catch (e) {
      print(e);
    }
  }

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
          'Add Kaffee',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Coffee",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(height: 3),
              Text(
                "Create your Special Coffee recipe",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16),
              ),
              SizedBox(height: 30),
              Text(
                "Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerName,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 3)),
                  hintText: 'Your coffee name',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Category",
                style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerDes,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 3)),
                  hintText: 'Coffe Based or Non Coffee Based',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Description",
                style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerDescription,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 3)),
                  hintText: 'Description ur coffee',
                  hintStyle: TextStyle(
                      
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Cover image",
                style: TextStyle(
                    
                    color: Colors.black,
                    fontSize: 16),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controllerImage,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 3)),
                  hintText: 'http://images.jpg',
                  hintStyle: TextStyle(
                      
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate",
                          style: TextStyle(
                              
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerRate,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            fillColor: Colors.grey.shade300,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 3)),
                            hintText: '1 - 5',
                            hintStyle: TextStyle(
                                
                                color: Colors.grey,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: controllerPrice,
                          decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300)),
                            fillColor: Colors.grey.shade300,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 3)),
                            hintText: 'Rp.',
                            hintStyle: TextStyle(
                                
                                color: Colors.grey,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // SizedBox(height: 18),
              // Text(
              //   "Ingredients",
              //   style: TextStyle(
              //       fontFamily: 'OpenSans-Bold',
              //       color: Colors.black,
              //       fontSize: 16),
              // ),
              // SizedBox(height: 10),
              // TextFormField(
              //   controller: controllerImage,
              //   maxLines: 7,
              //   minLines: 5,
              //   decoration: InputDecoration(
              //     filled: true,
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade300)),
              //     fillColor: Colors.grey.shade300,
              //     enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: BorderSide(color: Colors.grey.shade300, width: 3)),
              //     hintText: 'Write the ingredients',
              //     hintStyle: TextStyle(
              //         fontFamily: 'OpenSans-Light',
              //         color: Colors.grey.shade300,
              //         fontSize: 16),
              //   ),
              // ),
              SizedBox(height: 18),
              // Text(
              //   "Direction",
              //   style: TextStyle(
              //       fontFamily: 'OpenSans-Bold',
              //       color: Colors.black,
              //       fontSize: 16),
              // ),
              // SizedBox(height: 10),
              // TextFormField(
              //   controller: controllerDirection,
              //   maxLines: 7,
              //   minLines: 5,
              //   decoration: InputDecoration(
              //     filled: true,
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade300)),
              //     fillColor: Colors.grey.shade300,
              //     enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: BorderSide(color: Colors.grey.shade300, width: 3)),
              //     hintText: 'Write the directions',
              //     hintStyle: TextStyle(
              //         fontFamily: 'OpenSans-Light',
              //         color: Colors.grey.shade300,
              //         fontSize: 16),
              //   ),
              // ),
              // SizedBox(height: 18),
              // Text(
              //   "Category",
              //   style: TextStyle(
              //       fontFamily: 'OpenSans-Bold',
              //       color: Colors.black,
              //       fontSize: 16),
              // ),
              // SizedBox(height: 10),
              // TextFormField(
              //   controller: controllerCat,
              //   decoration: InputDecoration(
              //     filled: true,
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade300)),
              //     fillColor: Colors.grey.shade300,
              //     enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: BorderSide(color: Colors.grey.shade300, width: 3)),
              //     hintText: 'Choose one : Fried, Soup, Drink, Cake',
              //     hintStyle: TextStyle(
              //         fontFamily: 'OpenSans-Light',
              //         color: Colors.grey.shade300,
              //         fontSize: 16),
              //   ),
              // ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  add(
                      controllerName.text,
                      controllerPrice.text,
                      controllerDescription.text,
                      controllerImage.text,
                      controllerDes.text,
                      int.parse(controllerRate.text));
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 48, 91, 60),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
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