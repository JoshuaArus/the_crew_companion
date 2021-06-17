import 'package:flutter/material.dart';

import '../../constant.dart';

class GoalButton extends StatelessWidget {
  GoalButton({
    Key? key,
    required this.text,
    required this.tooltip
  }) : super(key: key);

  final String text;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color : primaryColor,
        ),
        color: secondaryColor,
        shape: BoxShape.circle
      ),
      child: IconButton(
        tooltip: tooltip,
        onPressed: null,
        icon: FittedBox(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline6
          )
        ),
      )
    );
  }
}