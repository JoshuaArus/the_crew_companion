import "package:flutter/material.dart";
import 'package:the_crew_companion/entities/team.dart';

import '../../constant.dart';


class TeamName extends StatelessWidget {
  const TeamName({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      team.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(decoration: TextDecoration.underline),
      )
    );
  }
}

class TeamPlayers extends StatelessWidget {
  const TeamPlayers({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 5,
      direction: Axis.horizontal,
      children: team.players.map((player) => 
          Chip(
            label: Text(
              player,
              style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white70),
          )
        )
      ).toList()
    );
  }
}


class TeamProgress extends StatelessWidget {
  const TeamProgress({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {

    return Chip(
      label:  Text(
        "Prochaine mission : " + 
          (team.achievedMissions.length > 0
          ? (team.achievedMissions.last.id + 1).toString()
          : "1"),
        style: Theme.of(context).textTheme.subtitle1,
      )
    );
  }
}

class TeamListItem extends StatelessWidget {
  const TeamListItem({
    Key? key,
    required this.team,
    required this.child
  }) : super(key: key);

  final Team team;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: primaryColor.withOpacity(0.70),
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(defaultPadding)),
          color: Theme.of(context)
              .backgroundColor
              .withOpacity(0.30)),
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: child
      )
    );
  }
}