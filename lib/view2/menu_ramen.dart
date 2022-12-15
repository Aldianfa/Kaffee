
import 'package:dataramen/view/loginn.dart';
import 'package:flutter/material.dart';

import '../models/Ramene.dart';
import '../service/ramene_service.dart';

class Teks extends StatefulWidget {
  const Teks({Key? key}) : super(key: key);

  @override
  State<Teks> createState() => _TeksState();
}

class _TeksState extends State<Teks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        leading: new Container(),
        actions: [
          IconButton(
            icon: new Icon(Icons.logout_outlined),
            color: Colors.black,
            onPressed: () {
              print('Sudah Logout');
              Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context) => loginn()));
            }
          )
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Card(
            child: Center(
                child: Text(
              "Data Ramene",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            height: 10,
          ),
            FutureBuilder<List<Ramene>>(
              future: RameneService.getDataRamen(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
                } else {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, i) {
                            return Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.network(
                                    "${snapshot.data![i].img_url}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.black26,
                                      child: Text(
                                        "${snapshot.data![i].product_name}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: Colors.black26,
                                      child: Text(
                                        "Rp ${snapshot.data![i].price}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    );
                  }
                }
              }
              )
        ]),
      ),
    );
  }
}
