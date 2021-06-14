import 'package:flutter/material.dart';

import '../../constant.dart';

// ignore: must_be_immutable
class GoalButton extends StatelessWidget {
  GoalButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  bool usePrimaryColor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color : primaryColor
        ),
        color: usePrimaryColor ? primaryColor : secondaryColor,
        shape: BoxShape.circle
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        )
      )
    );
    // return TextButton(
    //   onPressed: null,
    //   child: child,
    // );
  }
}

// ignore: must_be_immutable
class AimButton extends GoalButton {
  AimButton({
    Key? key,
    required text,
  }) : super(key: key, text: text) {
    usePrimaryColor = true;
  }
}