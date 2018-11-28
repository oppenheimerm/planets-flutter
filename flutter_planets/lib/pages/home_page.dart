import 'package:flutter/material.dart';
import 'package:flutter_planets/common_widgets/appbar_gradient.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar(
            "treva"
          )
        ],
      ),
    );
  }
}