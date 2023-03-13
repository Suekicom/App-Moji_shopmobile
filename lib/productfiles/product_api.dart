import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  int? id;
  String? name;
  int? price;
  String? size;
  String? image;
  String? description;
  String? category;

  Products(
      {this.id,
      this.name,
      this.price,
      this.size,
      this.image,
      this.description,
      this.category});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    size = json['size'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['size'] = this.size;
    data['image'] = this.image;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}
// class Products {
//   int? id;
//   String? name;
//   int? price;
//   String? image;
//   String? band;
//   String? category;

//   Products(
//       {this.id, this.name, this.price, this.image, this.band, this.category});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     image = json['image'];
//     band = json['band'];
//     category = json['category'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['image'] = this.image;
//     data['band'] = this.band;
//     data['category'] = this.category;
//     return data;
//   }
// }


