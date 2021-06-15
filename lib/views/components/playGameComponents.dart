import 'package:flutter/material.dart';

import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/entities/mission.dart';

import '../../constant.dart';

class MissionDescription extends StatelessWidget {
  const MissionDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class MissionAims extends StatelessWidget {
  const MissionAims({
    Key? key,
    required this.currentMission,
  }) : super(key: key);

  final Mission currentMission;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AimButton(text: currentMission.aimCount > 0 ? currentMission.aimCount.toString() : "-")
      ]..addAll(currentMission.aimOptions.map((ao) => GoalButton(text: ao.displayValue)).toList()),
    );
  }
}

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