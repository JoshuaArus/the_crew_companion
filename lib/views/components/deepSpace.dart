import 'dart:async';
import 'package:flutter/material.dart';

class DeepSpace extends StatefulWidget {
  const DeepSpace({Key? key}) : super(key: key);

  @override
  _DeepSpaceState createState() => _DeepSpaceState();
}

class _DeepSpaceState extends State<DeepSpace> {
  bool showFirst = true;
  int animationDuration = 10000;
  late Widget background;
  late Widget rotatedBackground;

  double opacity1 = 1;
  double opacity2 = 0;

  @override
  void initState() {
    super.initState();

    background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/homeScreenBackground.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );

    rotatedBackground = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/homeScreenBackground2.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );

    changeState();
  }

  void changeState() {
    Future.delayed(
        Duration(
          milliseconds: animationDuration,
        ), () {
      print("opacity1 : " + opacity1.toString());
      print("opacity2 : " + opacity2.toString());

      setState(() {
        double tmp = opacity1;
        opacity1 = opacity2;
        opacity2 = tmp;
      });
      changeState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: opacity1,
            duration: Duration(milliseconds: animationDuration),
            child: background,
          ),
          AnimatedOpacity(
            opacity: opacity2,
            duration: Duration(milliseconds: animationDuration),
            child: rotatedBackground,
          ),
        ],
      ),
    );
  }
}
