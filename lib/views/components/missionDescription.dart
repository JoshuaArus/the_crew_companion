import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/views/components/missionAims.dart';

class MissionDescription extends StatelessWidget {
  const MissionDescription({required this.mission});

  final Mission mission;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownBody(
          data: mission.description,
          styleSheet: MarkdownStyleSheet(textAlign: WrapAlignment.spaceEvenly),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        Divider(),
        MissionAims(currentMission: mission)
      ],
    );
  }
}
