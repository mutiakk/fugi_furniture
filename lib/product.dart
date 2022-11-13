class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.star,
    this.price,
    this.desc,
    this.image,
  });

  int? id;
  String? name;
  int? star;
  int? price;
  String? desc;
  String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: json["id"],
        name: json["name"],
        star: json["star"],
        price: json["price"],
        desc: json["desc"],
        image: json["image"],
      );
}

