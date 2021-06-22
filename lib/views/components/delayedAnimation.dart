import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  const DelayedAnimation({required this.child, required this.delay});

  final Widget child;
  final int delay;

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    final curve =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    offset = Tween<Offset>(
      begin: Offset(0, -0.5),
      end: Offset(0, 0),
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animationController,
        child: SlideTransition(
          child: widget.child,
          position: offset,
        ));
  }
}
