import 'package:flutter/material.dart';
import 'package:flutter_planets/common_widgets/planet_summary.dart';
import 'package:flutter_planets/models/planet_model.dart';

//  Represents a body element for our home page
class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Using an Expanded widget makes a child of a Row, Column, or Flex 
    //  expand to fill the available space in the main axis (e.g., horizontally 
    //  for a Row or vertically for a Column).  
    //  see: https://docs.flutter.io/flutter/widgets/Expanded-class.html
    /*return new Expanded(
      child: new ListView.builder(
        itemBuilder: (context, index) => new PlanetRow(planets[index]),
        itemCount: planets.length,
      ),
    );*/

    //  Using slivers instead of the the standard ListView
    return new Expanded(
      child: new Container(
        color:new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                 //  We provide a SliverChildBuilderDelegate as delegate. This works similar 
                //  to the ListView.builder, by providing a function to create each item and 
                //  the number of items.
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new PlanetSummary(planets[index]),
                  childCount: planets.length,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}