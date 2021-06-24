import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';

class GoalButton extends StatelessWidget {
  GoalButton({required this.child, required this.tooltip});

  final Widget child;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          color: secondaryColor,
          shape: BoxShape.circle),
      child: IconButton(
        tooltip: tooltip,
        onPressed: null,
        icon: FittedBox(
          child: child,
        ),
      ),
    );
  }
}
