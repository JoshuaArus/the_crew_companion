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
  late double paddingLeft;
  late double paddingRight;
  late double maxPosY;
  late int fallingSpeed;
  late int rotationSpeed;

  bool ready = false;

  late AnimationController fallingController;
  late AnimationController rotationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    maxPosY = widget.parentHeight;

    fallingController = AnimationController(
      vsync: this,
    );

    rotationController = AnimationController(
      vsync: this,
    );

    final curve = CurvedAnimation(
      parent: fallingController,
      curve: Curves.linear,
    );

    offset = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 1),
    ).animate(curve);

    fallingController.addListener(() {
      setState(() {});
    });

    Timer(Duration(milliseconds: rng.nextInt(2000)), () {
      ready = true;
      _scroll();
    });
  }

  void _scroll() {
    asteroidSize = rng.nextDouble() * 50 + 30; // [30 - 80] px
    paddingLeft = rng.nextDouble() * widget.parentWidth; //padding from left
    paddingRight = max(
      (widget.parentWidth - paddingLeft - asteroidSize),
      0,
    ); // padding from right

    rotationSpeed = rng.nextInt(10000) + 1000; // [1000 - 10200] milliseconds
    rotationController.duration = Duration(milliseconds: rotationSpeed);
    rotationController.value = 0;

    rotationController.repeat();

    fallingSpeed = rng.nextInt(10000) + 500; // [500 - 10500] milliseconds

    fallingController.duration = Duration(milliseconds: fallingSpeed);
    fallingController.value = 0;

    fallingController.forward().then((value) {
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
        child: AnimatedBuilder(
          animation: rotationController,
          child: Image.asset(
            "assets/images/asteroid.png",
          ),
          builder: (_, child) {
            return Transform.rotate(
              angle: rotationController.value * 2 * pi,
              child: child,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    fallingController.dispose();
    rotationController.dispose();
    super.dispose();
  }
}
