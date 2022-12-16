import 'package:dataramen/view/loginn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class registerr extends StatefulWidget {
  const registerr({Key? key}) : super(key: key);

  @override
  State<registerr> createState() => _registerrState();
}

class _registerrState extends State<registerr> {
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  


  // method register 
  void register(String email, password) async {
    try {
      // ME-POST atau MENAMBAH data json dari link 
      var response = await Dio().post('http://172.20.10.6:3000/user',
          data: {"email": email, "password": password});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => loginn(),));
      } else {
        print("Registration Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    // Untuk inisialisasi size w dan h
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                SizedBox(height: 100),
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


                Text('Register Here',
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
                register(controllerEmail.text, controllerPass.text);
              },
              child: Text("SIGN UP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary:Color.fromARGB(255, 48, 91, 60),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),

            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    )),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => loginn(),
                    ));
                  },
                  child: Text("Sign in",
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
    );
  }
}