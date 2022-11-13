import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  Map<String, dynamic> data;

  DetailPage({Key? key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken_outlined)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ))
        ],
        title: Text("Title"),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Wooden Coff"),
                      Text("250"),
                    ],
                  ),
                  Icon(Icons.stars),
                  Row(
                    children: [
                      Text( widget.data['example'].name,),
                      Text("Color"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
