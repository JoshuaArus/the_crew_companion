import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

class TeamProgress extends StatelessWidget {
  const TeamProgress({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          AppLocalizations.instance!.translate('missionNext') + " : " +
              (team.achievedMissions.length + 1).toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
