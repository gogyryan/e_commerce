class ProductModel {
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  bool? infav;
  bool? incart;
  dynamic? rate;
  String? category;
  String? maincategory;

  /* ProductModel({this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this. image,
    this. name,
    this. infav,
    this. incart,
    this. rate,
    this. category,
  });*/

  ProductModel.fromJson(Map<String, dynamic>? json)
  {
    id = json!['id'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    infav = json['infav'];
    incart = json['incart'];
    rate = json['rate'];
    category=json['category'];
    maincategory=json['maincategory'];

  }
}