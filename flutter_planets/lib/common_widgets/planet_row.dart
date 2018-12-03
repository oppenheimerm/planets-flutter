import 'package:flutter/material.dart';

//  an instance of a row(planet)
class PlanetRow extends StatelessWidget {

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 16.0
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage("assets/img/mars.png"),
      height: 92.0,
      width: 92.0,
    ),
  );

  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
        color: new Color(0xFF333366),
             shape: BoxShape.rectangle,
             borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
    color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
        )
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      //  The row consists of two objects, the planet image and a blue
      // rectangle with the text. As the planet overlaps the rectangle, the best
      // way to organize them is to put them in a Stack widget.
      child: new Stack(
        children: <Widget>[
          //  the card goes behind the thumbnail, it should be declared first.
          planetCard,
          planetThumbnail
        ],
      ),
    );
  }
}