import 'package:flutter/material.dart';
import 'package:planetarium/models/planet.dart';

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
        backgroundColor: Colors.grey[500]),
    Planet(
        title: "Venus",
        imageURI: "images/venus-transparent.png",
        backgroundColor: Colors.brown[100]),
    Planet(
        title: "Earth",
        imageURI: "images/earth-transparent.png",
        backgroundColor: Colors.blue[500]),
    Planet(
        title: "Mars",
        imageURI: "images/mars-transparent.png",
        backgroundColor: Colors.brown[400]),
    Planet(
        title: "Jupiter",
        imageURI: "images/jupiter-transparent.png",
        backgroundColor: Colors.brown[200]),
    Planet(
        title: "Saturn",
        imageURI: "images/saturn-transparent.png",
        backgroundColor: Colors.brown[300]),
    Planet(
        title: "Uranus",
        imageURI: "images/uranus-transparent.png",
        backgroundColor: Colors.blue[200]),
    Planet(
        title: "Neptune",
        imageURI: "images/neptune-transparent.png",
        backgroundColor: Colors.blue[800]),
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
          itemCount: _planets.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/background.jpeg"))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          "Welcome to planetarium!",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/background.jpeg"))),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            top: 100,
                            left: 50,
                            child: Transform.translate(
                              offset: Offset(-(_pageOffset - index) * 200, 0),
                              child: Text(
                                _planets[index - 1].title,
                                style: TextStyle(fontSize: 80),
                              ),
                            )),
                        Positioned(
                            bottom: 20,
                            right: -40,
                            child: Transform.translate(
                              offset: Offset(-(_pageOffset - index) * 500, 0),
                              child: Image(
                                height: 350,
                                width: 350,
                                image: AssetImage(_planets[index - 1].imageURI),
                              ),
                            ))
                      ],
                    ));
          },
        ));
  }
}
