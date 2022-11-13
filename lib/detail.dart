import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fugi_furniture/product.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data}) : super(key: key);

  final ProductModel data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    widget.data.image.toString(),
                  ),
                  fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: true,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Image.asset('asset/img_1.png'),
                iconSize: 50,
                onPressed: () {},
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ))
            ],
            title: Text(
              "Detail",
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(letterSpacing: 2, color: Colors.black)),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset("asset/img_2.png"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.name.toString(),
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 22)),
                            ),
                            Text(
                              "Rp ${widget.data.price.toString()}",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.grey)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Quantity",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ),
                            // Row(children: [
                            //   ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //         minimumSize: Size(20, 20),
                            //       ),
                            //       onPressed: () {},
                            //       child: Text(
                            //         '+',
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold),
                            //       )),
                            //   Padding(
                            //     padding: EdgeInsets.only(left: 2, right: 2),
                            //     child: Text(0.toString()),
                            //   ),
                            //   ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //         minimumSize: Size(20, 20),
                            //       ),
                            //       onPressed: () {},
                            //       child: Text(
                            //         '-',
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold),
                            //       ))
                            // ]),
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('+'),
                                  ),
                                  Container(
                                    child: Text("0"),
                                    color: Colors.grey,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('-'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: widget.data.star!.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ),
                        Text(widget.data.desc.toString(),
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    height: 2))),
                      ])))),
        ])));
  }
}
