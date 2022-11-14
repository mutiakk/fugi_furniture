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
  double? star;
  int? price;
  String? desc;
  String? image;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        star: json["star"],
        price: json["price"],
        desc: json["desc"],
        image: json["image"],
      );
}

List<ProductModel> listproduct = [
  ProductModel(
      id: 1,
      name: 'Kursi Empuk',
      star: 4.5,
      price: 250,
      desc: "Kursi Empuk Kebanggaan kita semua",
      image: "asset/img.png"),
  ProductModel(
      id: 2,
      name: 'Kursi Goyang',
      star: 2,
      price: 250,
      desc:
          "Kursi yang bisa goyang ke depan dan kebelakang dibuat seperti anak sendiri",
      image: "asset/img.png"),
];
