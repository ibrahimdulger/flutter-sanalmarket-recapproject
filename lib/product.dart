import 'package:flutter/material.dart';
import 'package:fmarket/product_details.dart';

class Product extends StatefulWidget {
  final String categoryName;

  const Product({Key key, this.categoryName}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Widget> productsToShow;
  @override
  void initState() {
    super.initState();
    if (widget.categoryName == "temel gıda") {
      productsToShow = [
        productCard(
          "Zeytin Yağı",
          "25 TL",
          "https://cdn.pixabay.com/photo/2015/06/26/15/31/oil-822618_1280.jpg",
          productExist: true,
        ),
        productCard(
          "Süt",
          "5 TL",
          "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993_1280.jpg",
          productExist: true,
        ),
        productCard(
          "Yumurta",
          "12 TL",
          "https://cdn.pixabay.com/photo/2015/09/17/17/19/eggs-944495_1280.jpg",
        ),
        productCard(
          "Beyaz Peynir",
          "20 TL",
          "https://cdn.pixabay.com/photo/2010/12/16/12/42/greek-feta-cheese-3548_1280.jpg",
        ),
      ];
    } else if (widget.categoryName == "şekerleme") {
      productsToShow = [
        productCard(
          "Jelibon",
          "5 TL",
          "https://cdn.pixabay.com/photo/2016/08/24/21/33/gummybears-1618074_1280.jpg",
        ),
        productCard(
          "Çikolatalı Gofret",
          "3 TL",
          "https://cdn.pixabay.com/photo/2017/04/04/17/06/chocolate-2202143_1280.jpg",
        ),
        productCard(
          "Makaron",
          "15 TL",
          "https://cdn.pixabay.com/photo/2019/03/13/15/31/macarons-4053115_1280.jpg",
        ),
        productCard(
          "Elma Şekeri",
          "5 TL",
          "https://cdn.pixabay.com/photo/2015/11/04/02/41/candy-1021779_1280.jpg",
        ),
      ];
    } else if (widget.categoryName == "içecekler") {
      productsToShow = [
        productCard(
          "Kutu Kola",
          "5 TL",
          "https://cdn.pixabay.com/photo/2014/09/26/19/51/drink-462776_1280.jpg",
        ),
        productCard(
          "Portakal Suyu",
          "5 TL",
          "https://cdn.pixabay.com/photo/2017/05/21/16/52/juice-2331722_1280.jpg",
        ),
        productCard(
          "6'lı Soda",
          "10 TL",
          "https://cdn.pixabay.com/photo/2017/02/02/15/15/bottle-2032980_1280.jpg",
        ),
      ];
    } else if (widget.categoryName == "temizlik") {
      productsToShow = [
        productCard(
          "Bulaşık Tablet",
          "20 TL",
          "https://cdn.pixabay.com/photo/2016/10/31/21/18/dishwasher-1786821_1280.jpg",
        ),
        productCard(
          "Mikrofiber Bez",
          "12 TL",
          "https://cdn.pixabay.com/photo/2018/11/02/09/27/microfiber-3789848_1280.jpg",
        ),
      ];
    }
  }

  Widget productCard(
      String productName, String productPrice, String productImageUrl,
      {bool productExist = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      productName: productName,
                      productImageUrl: productImageUrl,
                      productPrice: productPrice,
                      productExist: productExist,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: productImageUrl,
              child: Container(
                width: 140.0,
                height: 90.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        productImageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              productName,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: productsToShow,
    );
  }
}
