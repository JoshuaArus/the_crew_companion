import "package:flutter/material.dart";
import 'package:the_crew_companion/entities/team.dart';

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
        "Prochaine mission : " + (team.achievedMissions.length + 1).toString(),
        style: Theme.of(context).textTheme.subtitle1,
      )
    );
  }
}