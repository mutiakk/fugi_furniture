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
      name: 'Dufan',
      star: 4.5,
      price: 250,
      desc:
          "Dufan atau disebut juga Dunia Fantasi adalah theme park yang terletak di kawasan Taman Impian Jaya Ancol, Jakarta Utara, Indonesia yang diresmikan dan dibuka untuk umum pada tanggal 29 Agustus 1985",
      image: "asset/img.png"),
  ProductModel(
      id: 2,
      name: 'Dufan',
      star: 2,
      price: 250,
      desc:
      "Dufan atau disebut juga Dunia Fantasi adalah theme park yang terletak di kawasan Taman Impian Jaya Ancol, Jakarta Utara, Indonesia yang diresmikan dan dibuka untuk umum pada tanggal 29 Agustus 1985",
      image: "asset/img.png"),
];
