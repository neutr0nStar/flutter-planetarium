import 'package:flutter/material.dart';
import 'package:planetarium/models/planet.dart';
import 'package:planetarium/views/asteroids_info.dart';
import 'package:planetarium/views/moons_info.dart';
import 'package:planetarium/views/planet_info.dart';
import 'package:planetarium/views/sun_info.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  double _pageOffset = 0;
  List<Planet> _planets = [
    Planet(
        title: "Mercury",
        imageURI: "images/mercury-transparent.png",
        arURI: "https://go.echoar.xyz/d2w6",
        desc:
            "Mercury is the smallest and closest planet to the Sun in the Solar System. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the planets in the Solar System. "),
    Planet(
        title: "Venus",
        imageURI: "images/venus-transparent.png",
        arURI: "https://go.echoar.xyz/HGdi",
        desc:
            "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the brightest natural object in Earth's night sky after the Moon, Venus can cast shadows and can be, on rare occasion, visible to the naked eye in broad daylight."),
    Planet(
        title: "Earth",
        imageURI: "images/earth-transparent.png",
        arURI: "https://go.echoar.xyz/WSE2",
        desc:
            "Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29% of Earth's surface is land consisting of continents and islands."),
    Planet(
        title: "Mars",
        imageURI: "images/mars-transparent.png",
        arURI: "https://go.echoar.xyz/k4d6",
        desc:
            "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the \"Red Planet\"."),
    Planet(
        title: "Jupiter",
        imageURI: "images/jupiter-transparent.png",
        arURI: "https://go.echoar.xyz/cWpa",
        desc:
            "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two and a half times that of all the other planets in the Solar System combined."),
    Planet(
        title: "Saturn",
        imageURI: "images/saturn-transparent.png",
        arURI: "https://go.echoar.xyz/HmxQ",
        desc:
            "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine times that of Earth. It only has one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive"),
    Planet(
        title: "Uranus",
        imageURI: "images/uranus-transparent.png",
        arURI: "https://go.echoar.xyz/yz8N",
        desc:
            "Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus, who, according to Greek mythology, was the grandfather of Zeus and father of Cronus. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System"),
    Planet(
        title: "Neptune",
        imageURI: "images/neptune-transparent.png",
        arURI: "https://go.echoar.xyz/zWBx",
        desc:
            "Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, slightly more massive than its near-twin Uranus"),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _pageOffset = _pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          itemCount: _planets.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/background.jpeg"))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to planetarium!",
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Swipe to explore",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.grey[500]),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.grey[500])
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (index == _planets.length + 1) {
              return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/background.jpeg"))),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(-(_pageOffset - index) * 200, 0),
                          child: Text(
                            "More",
                            style: TextStyle(fontSize: 80),
                          ),
                        ),
                      ),
                      // Positioned(
                      //     top: 200,
                      //     left: 20,
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Transform.translate(
                      //           offset: Offset(-(_pageOffset - index) * 500, 0),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               Navigator.of(context).push(
                      //                   MaterialPageRoute(
                      //                       builder: (context) => SunInfo()));
                      //             },
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Hero(
                      //                   tag: "sun",
                      //                   child: Image(
                      //                       height: 150,
                      //                       image: AssetImage(
                      //                           "images/sun-transparent.png")),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(
                      //                   "Sun",
                      //                   style: TextStyle(fontSize: 32),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Transform.translate(
                      //           offset: Offset(-(_pageOffset - index) * 500, 0),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               Navigator.of(context).push(
                      //                   MaterialPageRoute(
                      //                       builder: (context) => MoonsInfo()));
                      //             },
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Hero(
                      //                   tag: "moon",
                      //                   child: Image(
                      //                       height: 150,
                      //                       image: AssetImage(
                      //                           "images/moon-transparent.png")),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(
                      //                   "Moons",
                      //                   style: TextStyle(fontSize: 32),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         Transform.translate(
                      //           offset: Offset(-(_pageOffset - index) * 500, 0),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               Navigator.of(context).push(
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           AsteroidsInfo()));
                      //             },
                      //             child: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Hero(
                      //                   tag: "asteroid",
                      //                   child: Image(
                      //                       height: 150,
                      //                       image: AssetImage(
                      //                           "images/asteroid-transparent.png")),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text(
                      //                   "Asteroids",
                      //                   style: TextStyle(fontSize: 32),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     )),
                      Positioned(
                          top: 160,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SunInfo()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sun",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.grey[300]),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            -(_pageOffset - index) * 500, 0),
                                        child: Hero(
                                          tag: "sun",
                                          child: Image(
                                              height: 150,
                                              image: AssetImage(
                                                  "images/sun-transparent.png")),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MoonsInfo()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Moons",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.grey[300]),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            -(_pageOffset - index) * 500, 0),
                                        child: Hero(
                                          tag: "moon",
                                          child: Image(
                                              height: 150,
                                              image: AssetImage(
                                                  "images/moon-transparent.png")),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AsteroidsInfo()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Asteroids",
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.grey[300]),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            -(_pageOffset - index) * 500, 0),
                                        child: Hero(
                                          tag: "asteroid",
                                          child: Image(
                                              height: 150,
                                              image: AssetImage(
                                                  "images/asteroid-transparent.png")),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ));
            } else {
              return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/background.jpeg"))),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 20,
                        child: Transform.translate(
                          offset: Offset(-(_pageOffset - index) * 200, 0),
                          child: Text(
                            _planets[index - 1].title,
                            style: TextStyle(fontSize: 80),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 160,
                          left: 20,
                          child: Text(
                            "Tap on the planet to know more",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[500]),
                          )),
                      Positioned(
                          bottom: 10,
                          right: -40,
                          child: Transform.translate(
                            offset: Offset(-(_pageOffset - index) * 500, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlanetInfo(
                                        planet: _planets[index - 1])));
                              },
                              child: Hero(
                                tag: "image" + _planets[index - 1].title,
                                child: Image(
                                  height: 375,
                                  image:
                                      AssetImage(_planets[index - 1].imageURI),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ));
            }
          },
        ));
  }
}
