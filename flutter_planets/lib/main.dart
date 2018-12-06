import 'package:flutter/material.dart';
import 'package:flutter_planets/pages/home_page.dart';
import 'package:flutter_planets/pages/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planets',
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        //  dictionary of String keys
        '/detail' : (_) => new DetailPage()
      }
    );
  }
}

