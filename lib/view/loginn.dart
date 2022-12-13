import 'package:dataramen/view/home.dart';
import 'package:dataramen/view/registerr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

class loginn extends StatefulWidget {
  const loginn({Key? key}) : super(key: key);

  @override
  State<loginn> createState() => _loginnState();
}

class _loginnState extends State<loginn> {
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
    try {
      // ME-GET atau Mengambil data json dari link
      var response = await Dio().get('http://192.168.18.69:3000/user');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan, 
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home_page()));
            
            break;
          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
     final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Login Failed',
          // e.toString(),
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            color: Colors.white,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    // Untuk inisialisasi size w dan h
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: 
                AssetImage(
                  'assets/img/background.png',
                  
                ),
                fit: BoxFit.cover
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/img/roundlogo.png'),
                  )
                ],
              ),
            ),
            // WIDGET FIELD DKK
            Container(
              margin: const EdgeInsets.only(left: 32, right: 32),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
      
                  Text('Login Here',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  ),
      
                  SizedBox(height: 40,),
      
                  // INPUT EMAIL
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: controllerEmail,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16
                      ),
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon: Icon(Icons.email_rounded, color: Colors.black,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0
                          )
                        ),
                      ),
                    ),
                  ),
      
                  SizedBox(height: 8,),
      
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1,1),
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      controller: controllerPass,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16
                      ),
                      decoration: InputDecoration(
                        hintText: "Your Password",
                        prefixIcon: Icon(Icons.password_rounded, color: Colors.black,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0
                          )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 90,),
                  
      
                  // BUTTON
                  ElevatedButton(
                onPressed: () {
                  // memanggil method register, dengan parameter yg sudah diinputkan melalui text field
                  login(controllerEmail.text, controllerPass.text);
                },
                child: Text("Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                style: ElevatedButton.styleFrom(
                    primary:Color.fromARGB(255, 172, 145, 101),
                    minimumSize: const Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
      
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont Have Account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      )),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => registerr(),
                      ));
                    },
                    child: Text("Register Here",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 48, 91, 60),
                        )),
                  ),
                ],
              )
      
                ],
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}