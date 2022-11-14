import 'package:flutter/material.dart';

import 'cart.dart';
import 'main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;


  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const MyHomePage(),
    const CartPage(),
    const MyHomePage(),
    const CartPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: ""
          ),
        ],
      ),
    );
  }


}
