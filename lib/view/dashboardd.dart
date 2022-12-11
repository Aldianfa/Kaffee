
import 'dart:ui';

import 'package:dataramen/view/loginn.dart';

import 'package:dataramen/view/registerr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class dashboardd extends StatefulWidget {
  @override
  State<dashboardd> createState() => _dashboarddState();
}

class _dashboarddState extends State<dashboardd> {

  @override
  Widget build(BuildContext context) {
    return Container(
        
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
            image: DecorationImage        (
              image: AssetImage("assets/img/backgroundd.png"),
              fit: BoxFit.cover,
            )
          ),
          
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
          alignment: Alignment.center,
          child:Column(
            children: [
              Image.asset('assets/img/up.png', height: 150, width: 124),
            Text(
              'Youll be smiling all day',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 300,
            ),

            // REGISTER BUTTON
            SizedBox(
              height: 59,
              width: 276,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 48, 91, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  print("tesss");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registerr()));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 172, 145, 101)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // LOGIN PAGE
            SizedBox(
              height: 59,
              width: 276,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  side: BorderSide(color: Color.fromARGB(255, 172, 145, 101)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  print("tesss");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginn()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 172, 145, 101)),
                ),
              ),
            ),

            SizedBox(height: 50,),

            Text('kaffee.01', style: TextStyle(
              fontSize: 8,
              color: Colors.grey,
            ),)
          ],
            
          ),
        ),
        )
      
      );
      
}
}