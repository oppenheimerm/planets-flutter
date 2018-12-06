import 'package:flutter/material.dart';
import 'package:flutter_planets/models/planet_model.dart';

class DetailPage extends StatelessWidget{

  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Planet Detail"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: new Text("<<< Go back"))
      ),
    );
  }
}