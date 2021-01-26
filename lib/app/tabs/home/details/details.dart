import 'package:dicoding_flutter_submission1/app/tabs/home/details/body_details.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map screenArguments = ModalRoute.of(context).settings.arguments;
    Map product = screenArguments['product'];
    int index = screenArguments['index'];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'detail_food$index',
            child: Container(
              alignment: Alignment.topCenter,
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(product['image']),
                ),
              ),
            ),
          ),
          BodyDetails(),
        ],
      ),
    );
  }
}
