import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';

abstract class LandscapableScreen extends StatefulWidget {
  const LandscapableScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final Controller controller;
}

mixin LandscapableScreenState<T extends LandscapableScreen> on State<T> {
  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Container()
              : CustomDrawer(
                  controller: widget.controller,
                  shouldPop: false,
                ),
          Expanded(
            child: buildBody(context),
          ),
        ],
      ),
    );
  }
}
