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
        child: Stack(children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Hero(
                  tag: "image" + this.planet.title,
                  child: Image(
                    height: 375,
                    image: AssetImage(this.planet.imageURI),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      Text(this.planet.title, style: TextStyle(fontSize: 80))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(this.planet.desc,
                    style: TextStyle(
                        fontSize: 20, color: Colors.grey[500], height: 1.4)),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 5,
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.grey[300],
                )),
          )
        ]),
      ),
    );
  }
}
