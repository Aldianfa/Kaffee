
import 'package:dataramen/view/login.dart';
import 'package:dataramen/view/register.dart';
import 'package:flutter/material.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key,}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 215, 85, 100),
      body: Container(
        
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          
          Image.asset('assets/images/logo3.png', height: 90, width: 98),

          SizedBox(height: 20,),

          Image.asset('assets/images/shoes.png', height: 280, width: 280,),
          
        
          SizedBox(height: 20,),

          
          Text('Gutten Morgen', textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10,),
          
          Text('Take Your Favourite Coffee', 
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            // color: Colors.black.withOpacity(0.5),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          ),
          
          SizedBox(height: 50,),

          SizedBox(
            height: 55,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed:(){
              print("tesss");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
              
            },
            
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0)
              ),
            ),
            ),
          ),
          SizedBox(height: 10,),

          SizedBox(
            height: 55,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide(color: Colors.grey)
            ),
            onPressed:(){
              print("tesss");
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(156, 0, 0, 0)
              ),
            ),
            ),
          ),
          
          // Container(
          //   width: 320,
          //   height: 55,
          //   child: TextButton(
          //     style: TextButton.styleFrom(
          //       backgroundColor: Color.fromARGB(255, 255, 166, 0),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //     ),
          //     onPressed: () {
          //       print('Sign in');
          //     },
          //     child: Text('Sign in', 
          //     style: TextStyle(
          //       color: Color.fromARGB(255, 255, 255, 255),
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold
          //     ),
          //     ),
          //   ),
          // ),
          
          //button bawah
          // RaisedButton(padding: EdgeInsets.symmetric(vertical: 21, horizontal: 130),
          //   onPressed: (){
          //   print('RaisedButton');
          // },
          // color: Colors.white,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          // child: Text('Register', style: TextStyle(
          //   color: Colors.grey,
          //   ),
          // ),
          // )


          
        ],
      ),
      )
      
    );
  }
}