import 'package:flutter/material.dart';
import 'package:fmarket/product.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: Colors.red[400],
          labelColor: Colors.red[400],
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          tabs: [
            Tab(child: Text("Temel Gıda")),
            Tab(child: Text("Şekerleme")),
            Tab(child: Text("İçecekler")),
            Tab(child: Text("Temizlik")),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              Product(categoryName: "temel gıda"),
              Product(categoryName: "şekerleme"),
              Product(categoryName: "içecekler"),
              Product(categoryName: "temizlik"),
            ],
          ),
        )
      ],
    );
  }
}
