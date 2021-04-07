import 'package:flutter/material.dart';
import 'package:planetarium/models/planet.dart';
import 'package:url_launcher/url_launcher.dart';

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
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () async {
                    await canLaunch(planet.arURI ?? "")
                        ? await launch(planet.arURI ?? "")
                        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Couldn't open in AR",
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.grey[800],
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                          ));
                  },
                  child: Text(
                    "Explore in AR",
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 5,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(80)),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.grey[400],
                )),
          )
        ]),
      ),
    );
  }
}
