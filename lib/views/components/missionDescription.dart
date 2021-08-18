import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/views/components/customMarkdownBody.dart';
import 'package:the_crew_companion/views/components/missionAims.dart';

class MissionDescription extends StatelessWidget {
  const MissionDescription({required this.mission});

  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomMarkdownBody(
          data: mission.description,
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        const Divider(),
        MissionAims(currentMission: mission)
      ],
    );
  }
}
