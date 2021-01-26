import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final int quantity;
  final String title;
  final bool internalScreen;

  CustomHeader({
    @required this.quantity,
    @required this.title,
    @required this.internalScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        (this.internalScreen)
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.arrow_back_ios, size: 28.0),
                ),
              )
            : Container(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 28.0,
                  color: Colors.transparent,
                ),
              ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
