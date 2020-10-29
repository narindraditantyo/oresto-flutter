import 'package:flutter/material.dart';
import 'package:oresto/views/detail_page.dart';
import 'package:oresto/views/home_page.dart';
import 'package:oresto/common/styles.dart';
import 'package:oresto/views/search_page.dart';

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
        '/detailPage': (context) => DetailPage(restoId: ModalRoute.of(context).settings.arguments),
        '/searchPage': (context) => SearchPage()
      },
    );
  }
}