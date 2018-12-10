import 'package:flutter/material.dart';
import 'package:flutter_planets/models/planet_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_planets/common_widgets/separator.dart';
import 'package:flutter_planets/common_widgets/planet_summary.dart';
import 'package:flutter_planets/common_widgets/text_style.dart';

class DetailPage extends StatelessWidget{

  final Planet planet;
  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new Container(
        //  Once we have all the components, we can delete this, as the scroll 
        //  for the content will already expand the content, but, while creating 
        //  the background and the gradient, using this constraint will make the 
        //  Container to use all the screen, instead being cut to the image size.
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        //  We use a Stack() as the following widgets will be stacked one on top
        //  of each other
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  //  Create a Container with a constraint to expand as much as possible keeping a 
  //  height of 300dp
  Container _getBackground(){
    return new Container(
      //  see: https://flutter.io/docs/cookbook/images/network-image
      //   display a placeholder at first, and images would fade in as they’re loaded
      child: new FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  //  
  Container _getGradient()
  {
    return new Container(
      //  add a top margin to make it fit to the image bottom
      //  the top margin and the height add up to 300dp, the exact height of the image
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          //  use 0.0 and 0.9 as stops to make the gradient achieve the solid part at the
          //  90%, as otherwise the border of the image was still slightly noticeable.
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  //  The content. It will be scrollable on top of the image and the gradient
  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new ListView(
      //  add a padding to 72dp on the top to left space for the image and 32dp at 
      //  the bottom to add a nice list ending
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(
          planet,
          horizontal: false,
        ),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle, style: Style.headerTextStyle,),
              new Separator(),
              new Text( planet.description, style: Style.commonTextStyle),
            ],
          )
        ),
      ],
    );
  }  

  Container _getToolbar(BuildContext context)
  {
    return new Container(
      margin: new EdgeInsets.only(
        top: MediaQuery
        .of(context)
        .padding
        .top
      ),
      child: new BackButton(color: Colors.white,),
    );
  }

}