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
  late double width;
  late double height;
  late double rotation;
  late double posX;
  late double maxPosY;
  late int speed;

  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    maxPosY = widget.parentHeight;

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      lowerBound: 0,
      upperBound: maxPosY,
    );

    controller.addListener(() {
      setState(() {
        // print("toto");
      });
    });

    controller.repeat();

    // controller = AnimationController(
    //   vsync: this,
    // );

    // _scroll();
  }

  // void _scroll() {
  //   width = rng.nextDouble() * 300; //px
  //   height = rng.nextDouble() * 300; //px
  //   rotation = rng.nextDouble() * 360; // °
  //   posX = rng.nextDouble(); //X starting position
  //   speed = rng.nextInt(10000) + 2000; //milliseconds

  //   controller.duration = Duration(milliseconds: speed);

  //   final curve = CurvedAnimation(
  //     parent: controller,
  //     curve: Curves.decelerate,
  //   );

  //   offset = Tween<Offset>(
  //     begin: Offset(0, -1),
  //     end: Offset(0, 1),
  //   ).animate(curve);

  //   controller.forward();

  //   // Timer(Duration(milliseconds: 1000), () {
  //   //   controller.forward().then((value) {
  //   //     print("fin de l'animation");
  //   //     // _scroll();
  //   //   });
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.1),
      height: widget.parentHeight,
      width: widget.parentWidth,
      child: CustomPaint(size: Size(widget.parentWidth, widget.parentHeight)
          // foregroundPainter: FallingAsteroidPainter(),
          ),
    );

    // return Container(
    //   color: Colors.red.withOpacity(0.1),
    //   width: widget.parentWidth,
    //   height: widget.parentHeight,
    //   child:
    //       // FittedBox(
    //       //   // fit: BoxFit.scaleDown,
    //       //   child:
    //       SlideTransition(
    //     position: offset,
    //     child: Transform.rotate(
    //       angle: rotation,
    //       child: Image.asset(
    //         "assets/images/asteroid.png",
    //         // height: height,
    //         // width: width,
    //       ),
    //     ),
    //     // ),
    //   ),
    // );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class FallingAsteroidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    // canvas.drawima(Image.asset("assets/images/asteroid.png"), Offset(0, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
