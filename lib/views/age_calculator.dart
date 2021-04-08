import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  TextEditingController _controller = TextEditingController();
  int _age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Find your age on other planets"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          try {
                            _age = int.parse(value ?? 0);
                          } catch (e) {
                            print("error");
                            _age = 0;
                          }
                        });
                      },
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder().copyWith(),
                          labelText: "Enter you age in earth years"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // Mercury
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/mercury-transparent.png"),
                      ),
                      Text(
                        (_age * 365 / 88).toStringAsFixed(2) + " mercury years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                  // Venus
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/venus-transparent.png"),
                      ),
                      Text(
                        (_age * 365 / 225).toStringAsFixed(2) + " venus years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                  // Mars
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/mars-transparent.png"),
                      ),
                      Text(
                        (_age / 1.88).toStringAsFixed(2) + " mars years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                  // Jupiter
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/jupiter-transparent.png"),
                      ),
                      Text(
                        (_age / 11.86).toStringAsFixed(2) + " jupiter years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                  // Saturn
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/saturn-transparent.png"),
                      ),
                      Text(
                        (_age / 29.46).toStringAsFixed(2) + " saturn years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                  // Uranus
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/uranus-transparent.png"),
                      ),
                      Text(
                        (_age / 84.01).toStringAsFixed(2) + " uranus years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image(
                        height: 100,
                        image: AssetImage("images/neptune-transparent.png"),
                      ),
                      Text(
                        (_age / 164.9).toStringAsFixed(2) + " neptune years",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
