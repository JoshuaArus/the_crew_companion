import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:the_crew_companion/entities/mission.dart';

import '../../constant.dart';
import 'missionAims.dart';

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