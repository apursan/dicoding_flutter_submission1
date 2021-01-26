import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final double width;
  final Color primaryColor;
  final String productUrl,
      productName,
      productPrice,
      productRate,
      productClients;

  FoodCard({
    @required this.width,
    @required this.primaryColor,
    @required this.productUrl,
    @required this.productName,
    @required this.productPrice,
    @required this.productRate,
    @required this.productClients,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 140.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(productUrl),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$productRate \($productClients\)',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  '\Rp $productPrice',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
