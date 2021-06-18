import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Center(
        child: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 5,
        )
      )
    );
  }
}