import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImageUrl;
  final bool productExist;

  const ProductDetail(
      {Key key,
      this.productName,
      this.productPrice,
      this.productImageUrl,
      this.productExist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Hero(
              tag: productImageUrl,
              child: Image.network(
                productImageUrl,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.red[400],
                size: 40.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              productName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Ürün Açıklaması",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50.0,
              decoration: BoxDecoration(
                color: productExist ? Colors.red[400] : Colors.black,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  productExist ? "Sepete Ekle" : "Stokta Yok",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
