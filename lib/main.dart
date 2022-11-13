import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fugi_furniture/detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
  static const List<Widget> _views = [
    Center(child: const Text('Content of Tab One')),
    Center(child: const Text('Content of Tab Two')),
    Center(child: const Text('Content of Tab Three')),
  ];
  static const List<Tab> _menuTab = [
    Tab(
      text: "All",
    ),
    Tab(
      text: "Kitchen",
    ),
    Tab(
      text: "Living Room",
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _menuTab.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Home",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(letterSpacing: 2, color: Colors.black)),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ]),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(right: 100, top: 10),
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Discover the most modern furniture",
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(letterSpacing: 2, fontSize: 22)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.brown,
                    tabs: _menuTab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: RectangularIndicator(
                      color: Colors.brown,
                      bottomLeftRadius: 100,
                      bottomRightRadius: 100,
                      topLeftRadius: 100,
                      topRightRadius: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                    height: double.infinity,
                    child: TabBarView(
                        controller: _tabController,
                        children: [mantap(), mantap(), mantap()]),
                  ),
                ),

            ]),
          ),
        );
  }

  Widget mantap() {
    return GridView.builder(
       // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.2 / 3),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>DetailPage(
                        data: {'product': myProducts[index]},
                      )));
            },
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //menambahkan bayangan
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/img.png"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      myProducts[index]["name"],
                      style:
                          GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp ${myProducts[index]["id"]}",
                          style: GoogleFonts.poppins(
                              textStyle:
                                  const TextStyle(fontSize: 20, color: Colors.grey)),
                        ),
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Text(
                                myProducts[index]["id"].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

// RatingBar.builder(
// initialRating: 3,
// minRating: 0,
// direction: Axis.horizontal,
// allowHalfRating: true,
// itemCount: 5,
// itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
// itemBuilder: (context, _) => Icon(
// Icons.star,
// color: Colors.amber,
// size: ,
// ),
// onRatingUpdate: (rating) {
// print(rating);
// },
// ),
