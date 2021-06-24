import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/mission.dart';

import 'package:the_crew_companion/constant.dart';
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
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AimButton(
              text: currentMission.aimCount > 0
                  ? currentMission.aimCount.toString()
                  : "")
        ]..addAll(
            currentMission.aimOptions
                .map(
                  (ao) => GoalButton(
                    child: ao.icon,
                    tooltip: ao.tooltip,
                  ),
                )
                .toList(),
          ),
      ),
    );
  }
}
