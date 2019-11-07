import 'package:flutter/material.dart';
import 'package:hunt/model/planets.dart';
import 'package:hunt/ui/common/plannet_summary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
          color: new Color(0xFF202442),
          child: Scaffold(
            backgroundColor: new Color(0xFF202442),
            body: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => new PlanetSummary(planets[index]),
                      childCount: planets.length,
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: Text('Let\'s Play'),
              icon: Icon(Icons.play_arrow),
              backgroundColor: Colors.pink,
            ),
          )),
    );
  }
}
