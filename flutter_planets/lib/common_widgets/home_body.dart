import 'package:flutter/material.dart';
import 'package:flutter_planets/common_widgets/planet_row.dart';
import 'package:flutter_planets/models/planet_model.dart';

//  Represents a body element for our home page
class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new PlanetRow(planets[0]),
        new PlanetRow(planets[1]),
        new PlanetRow(planets[2]),
      ],);
  }
}