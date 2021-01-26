import 'package:dicoding_flutter_submission1/app/app.dart';
import 'package:dicoding_flutter_submission1/app/tabs/home/details/details.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cera Pro",
        primaryColor: Colors.green,
      ),
      routes: {
        'details': (context) => Details(),
      },
      home: App(),
    );
  }
}
