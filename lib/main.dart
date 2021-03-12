import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fmarket/mycart.dart';
import 'package:fmarket/category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeContentNumber = 0;
  List _contents;

  @override
  void initState() {
    super.initState();
    _contents = [
      Category(),
      MyCart(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Speedy",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
      body: _contents[activeContentNumber],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("selçuk göçer"),
              accountEmail: Text("sgocer@gocer.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2012/10/26/01/28/man-63015_960_720.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red[400]),
            ),
            ListTile(
              title: Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("İndirimlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeContentNumber,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("Ürünler"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: ("Sepetim"),
          )
        ],
        onTap: (int positionNumberOfTappedButton) {
          setState(() {
            activeContentNumber = positionNumberOfTappedButton;
          });
        },
      ),
    );
  }
}
