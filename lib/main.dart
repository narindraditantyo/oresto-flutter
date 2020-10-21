import 'package:flutter/material.dart';
import 'package:oresto/detail.dart';
import 'package:oresto/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oResto',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detailPage': (context) => RestaurantDetail(restaurant: ModalRoute.of(context).settings.arguments)
      },
    );
  }
}