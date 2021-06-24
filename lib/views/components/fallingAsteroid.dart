import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FallingAsteroid extends StatefulWidget {
  const FallingAsteroid(
      {required this.parentWidth, required this.parentHeight});

  final double parentWidth;
  final double parentHeight;

  @override
  _FallingAsteroidState createState() => _FallingAsteroidState();
}

class _FallingAsteroidState extends State<FallingAsteroid>
    with TickerProviderStateMixin {
  var rng = Random();
  late double asteroidSize;
  late double rotation;
  late double paddingLeft;
  late double paddingRight;
  late double maxPosY;
  late int speed;

  bool ready = false;

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    maxPosY = widget.parentHeight;

    controller = AnimationController(
      vsync: this,
    );

    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    offset = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 1),
    ).animate(curve);

    controller.addListener(() {
      setState(() {});
    });

    Timer(Duration(milliseconds: rng.nextInt(2000)), () {
      ready = true;
      _scroll();
    });
  }

  void _scroll() {
    asteroidSize = rng.nextDouble() * 50 + 30; // [30 - 80] px
    rotation = rng.nextDouble() * 360; // °
    paddingLeft = rng.nextDouble() * widget.parentWidth; //padding from left
    paddingRight = max(
      (widget.parentWidth - paddingLeft - asteroidSize),
      0,
    ); // padding from right
    speed = rng.nextInt(10000) + 500; // [200 - 10200] milliseconds

    controller.duration = Duration(milliseconds: speed);
    controller.value = 0;

    controller.forward().then((value) {
      _scroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) return Container();

    return Container(
      width: widget.parentWidth,
      height: widget.parentHeight,
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
      ),
      child: SlideTransition(
        position: offset,
        child: Transform.rotate(
          angle: rotation,
          child: Image.asset(
            "assets/images/asteroid.png",
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
