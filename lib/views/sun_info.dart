import 'package:flutter/material.dart';

class SunInfo extends StatelessWidget {
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
                tag: 'sun',
                child: Image(image: AssetImage("images/sun-transparent.png")),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Sun", style: TextStyle(fontSize: 80))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light and infrared radiation. It is by far the most important source of energy for life on Earth. ",
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
