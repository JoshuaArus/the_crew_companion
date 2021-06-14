import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';

import '../constant.dart';

class TeamSummary extends StatelessWidget {
  const TeamSummary({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: primayColor.withOpacity(0.70),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(defaultPadding)
        ),
        color: Theme.of(context).backgroundColor.withOpacity(0.30)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              team.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              team.players.join(" - "),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white70),
            ),
            Text(
              team.achievedMissions.last.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white70),
            )
          ],
        )
      ),
    );
  }
}