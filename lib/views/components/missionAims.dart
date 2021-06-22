import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/mission.dart';

import '../../constant.dart';
import 'aimButton.dart';
import 'goalButton.dart';
import '../../entities/aimOption.dart';

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
                .map((ao) =>
                    GoalButton(text: ao.displayValue, tooltip: ao.tooltip))
                .toList(),
          ),
      ),
    );
  }
}
