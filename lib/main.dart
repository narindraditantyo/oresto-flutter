import 'package:flutter/material.dart';
import 'package:oresto/views/detail_page.dart';
import 'package:oresto/views/home_page.dart';
import 'package:oresto/common/styles.dart';

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
        '/detailPage': (context) => DetailPage(restoData: ModalRoute.of(context).settings.arguments)
      },
    );
  }
}