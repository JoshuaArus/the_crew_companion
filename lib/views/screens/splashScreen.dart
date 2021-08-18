import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 5,
      ),
    );
  }
}
