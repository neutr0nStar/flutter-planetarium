import 'package:flutter/material.dart';

class MoonsInfo extends StatelessWidget {
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
                tag: 'moon',
                child: Image(image: AssetImage("images/moon-transparent.png")),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Moons", style: TextStyle(fontSize: 80))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "A natural satellite, or moon, is, in the most common usage, an astronomical body that orbits a planet or minor planet. In the Solar System, there are six planetary satellite systems containing 205 known natural satellites.",
                    style: TextStyle(
                        fontSize: 20, color: Colors.grey[500], height: 1.4)),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Other moons",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          Image(
                              height: 200,
                              image: AssetImage(
                                  "images/callisto-transparent.png")),
                          Text("Callisto"),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Image(
                              height: 200,
                              image: AssetImage(
                                  "images/ganymede-transparent.png")),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Ganymede"),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Image(
                              height: 200,
                              image:
                                  AssetImage("images/triton-transparent.png")),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text("Triton"),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
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
