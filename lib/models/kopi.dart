// import 'dart:ffi';

class Kopi {
  int id;
  String name;
  String price;
  String description;
  String image;
  int rate;
  String des;

  Kopi(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.rate,
      required this.des});

  factory Kopi.fromJson(Map<String, dynamic> json) {
    return Kopi(
      id : json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      rate: json['rate'],
      des: json['des']
    );
  }


}
