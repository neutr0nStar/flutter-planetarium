import 'package:flutter/material.dart';

class AsteroidsInfo extends StatelessWidget {
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
                tag: 'asteroid',
                child:
                    Image(image: AssetImage("images/asteroid-transparent.png")),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Asteroids", style: TextStyle(fontSize: 70))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "Asteroids are small, rocky objects that orbit the Sun. Although asteroids orbit the Sun like planets, they are much smaller than planets. Asteroids are small, rocky objects that orbit the sun. Although asteroids orbit the sun like planets, they are much smaller than planets.",
                    style: TextStyle(
                        fontSize: 20, color: Colors.grey[500], height: 1.4)),
              ),
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
