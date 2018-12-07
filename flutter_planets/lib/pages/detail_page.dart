import 'package:flutter/material.dart';
import 'package:flutter_planets/models/planet_model.dart';

class DetailPage extends StatelessWidget{

  final Planet planet;
  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new Container(
        constraints: new BoxConstraints.expand(),        
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(planet.name),
            // Hero see planet_row
            new Hero(
              tag: "planet-hero-${planet.id}",
              child: new Image.asset(planet.image, width: 96.0, height: 96.0,),
            ),            
            new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text("<<< Go back"))
          ],
        )
      ),
    );
  }
}