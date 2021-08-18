import 'package:flutter/material.dart';
import 'package:the_crew_companion/views/components/fallingAsteroid.dart';

class FallingAsteroids extends StatefulWidget {
  final int asteroidNumber;

  const FallingAsteroids({required this.asteroidNumber});

  @override
  _FallingAsteroidsState createState() => _FallingAsteroidsState();
}

class _FallingAsteroidsState extends State<FallingAsteroids> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List<Widget>.filled(
        widget.asteroidNumber,
        LayoutBuilder(
          builder: (context, constraints) => FallingAsteroid(
              parentWidth: constraints.maxWidth,
              parentHeight: constraints.maxHeight),
        ),
        growable: true,
      ),
    );
  }
}
