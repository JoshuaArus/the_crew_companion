import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';

class LandscapableScreen extends StatelessWidget {
  const LandscapableScreen(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  final Controller controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Container()
              : CustomDrawer(
                  controller: controller,
                  shouldPop: false,
                ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
