import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/entities/mission.dart';

import '../../constant.dart';

class MissionDescription extends StatelessWidget {
  const MissionDescription({
    Key? key,
    required this.mission
  }) : super(key: key);

  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownBody(
          data: mission.description,
          styleSheet: MarkdownStyleSheet(
            textAlign: WrapAlignment.spaceEvenly
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: defaultPadding/2)),
        Divider(),
        MissionAims(currentMission: mission)
      ],
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
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AimButton(text: currentMission.aimCount > 0 ? currentMission.aimCount.toString() : "")
        ]..addAll(currentMission.aimOptions.map((ao) => GoalButton(text: ao.displayValue, tooltip: ao.tooltip)).toList()),
      )
    );
  }
}

// ignore: must_be_immutable
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
          color : primaryColor
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

// ignore: must_be_immutable
class AimButton extends StatelessWidget {
  AimButton({
    Key? key,
    required this.text,
  }) : super(key: key);
    
  final String text;

  @override
  Widget build(BuildContext context) {
    if (text == "")
      return Container();

    return Container(
      height: 50,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color : Colors.white,
          width: 2
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: primaryColor.withOpacity(0.7),
        shape:  BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        )
      )
    );
  }

}