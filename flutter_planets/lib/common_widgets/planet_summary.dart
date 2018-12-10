import 'package:flutter/material.dart';
import 'package:flutter_planets/models/planet_model.dart';
import 'package:flutter_planets/pages/detail_page.dart';
import 'package:flutter_planets/common_widgets/text_style.dart';
import 'package:flutter_planets/common_widgets/separator.dart';

//  an instance of a row(planet)
class PlanetSummary extends StatelessWidget {

  //  add a parameter to the constructor that receives a Planet object 
  //  and stores it in a final field
  final Planet planet;
  final bool horizontal;

  //  two constructors. The usual one that sets horizontal as true, and another 
  //  one named Planet.vertical that sets the value as false. We will use this 
  //  boolean to know what to do in the whole class.
  PlanetSummary(this.planet, {this.horizontal = true});
  PlanetSummary.vertical(this.planet): horizontal = false;

  @override
  Widget build(BuildContext context) {
    
    //  our planet thumbnail for this insance
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),

      //  simply align the image to the left or to the center depending on the value of horizontal.
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      
      //  Using a Hero
      child: new Hero(
        //  added a tag, with the value “planet-hero-” plus the planet id.
        //  ** need to add changes to details page
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
        
      ),
    );

    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            //  we added a simple container of 8dp width to make the separation a bit 
            //  larger, otherwise the two values look too close when centered.
            new Container(width: 8.0),
            new Text(planet.gravity, style: Style.smallTextStyle),
          ]
        ),
      );
    }  

    final planetCardContent = new Container(
      //  depending on boolean, the card content will have a left margin of 
      //  76dp or a top margin of 42dp, and 16dp for all other values.
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        //  ternary operator to decide if items on the card should align left or center.
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                //  the flex parameter makes the items expand as much as possible or 
                //  to the content. In the case of horizontal, we want them to be in the 
                //  left half and in the right half, but for the vertical one.
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: planet.distance,
                  image: 'assets/img/ic_distance.png')

              ),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                //  see above comment
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: planet.gravity,
                  image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );  

    final planetCard = new Container(
      child: planetCardContent,
      //  We setup different margins and height depending on the orientation. Try 
      //  to play around with the numbers.
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal ? new EdgeInsets.only(left: 46.0) : new EdgeInsets.only(top: 72.0),
      //  above comment
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );   

    // use the GestureDetector to o recognize gestures i.e onTap
    return new GestureDetector(
      onTap: horizontal
        //  as we do not want the card in the detail to be clickable, we set the 
        //  onClick callback to null if horizontal is false.
        ? () => Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(planet),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
            ),
        )
      : null,
      //  end comment
      child: new Container(
        margin: const EdgeInsets.symmetric( vertical: 16.0, horizontal: 24.0),        
      child: new Stack(
        children: <Widget>[
          planetCard,
          planetThumbnail,
        ],
        )
      ),
    );
  }
}