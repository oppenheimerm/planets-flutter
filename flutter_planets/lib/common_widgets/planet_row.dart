import 'package:flutter/material.dart';
import 'package:flutter_planets/models/planet_model.dart';

//  an instance of a row(planet)
class PlanetRow extends StatelessWidget {

  final Planet planet;
  PlanetRow(this.planet);

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(
      vertical: 16.0
    ),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage(planet.image),
      height: 92.0,
      width: 92.0,
    ),
  );

      final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
      fontSize: 12.0
    );
    final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );

    Widget _planetValue({String value, String image}) {
      return new Row(
        children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(planet.gravity, style: regularTextStyle),
        ]
      );
    }    

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: subHeaderTextStyle),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff)
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: _planetValue(
                  value: planet.distance,
                  image: 'assets/img/ic_distance.png')

              ),
              new Expanded(
                child: _planetValue(
                  value: planet.gravity,
                  image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    //  we should wrap our whole row widget in a GestureDetector Widget,
    //  to handle all the physical interactions with the user.
    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (_, __, ___) => new DetailPage(planet),
      )),
      child:  new Container(
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
      ),
    );
  }
}