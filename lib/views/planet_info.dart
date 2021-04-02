import 'package:flutter/material.dart';
import 'package:planetarium/models/planet.dart';

class PlanetInfo extends StatelessWidget {
  final Planet planet;

  PlanetInfo({this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: "image" + planet.title,
              child: Image(
                height: 375,
                image: AssetImage(planet.imageURI),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(planet.title, style: TextStyle(fontSize: 80))),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(planet.desc,
                style: TextStyle(
                    fontSize: 20, color: Colors.grey[500], height: 1.4)),
          )
        ],
      )),
    );
  }
}
