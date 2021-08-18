import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/mission.dart';

import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/views/components/aimButton.dart';
import 'package:the_crew_companion/views/components/goalButton.dart';

class MissionAims extends StatelessWidget {
  const MissionAims({
    Key? key,
    required this.currentMission,
  }) : super(key: key);

  final Mission currentMission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AimButton(
              text: currentMission.aimCount > 0
                  ? currentMission.aimCount.toString()
                  : ""),
          ...currentMission.aimOptions
              .map(
                (ao) => GoalButton(
                  tooltip: ao.tooltip,
                  child: ao.buildIcon(context),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
