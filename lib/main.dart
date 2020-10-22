import 'package:flutter/material.dart';
import 'package:oresto/detail.dart';
import 'package:oresto/home.dart';
import 'package:oresto/typography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oResto',
      theme: ThemeData(
        textTheme: typoTheme
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detailPage': (context) => RestaurantDetail(restaurant: ModalRoute.of(context).settings.arguments)
      },
    );
  }
}