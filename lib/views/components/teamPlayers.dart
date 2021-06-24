import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/constant.dart';

class TeamPlayers extends StatelessWidget {
  const TeamPlayers({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: defaultPadding),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 5,
        direction: Axis.horizontal,
        children: team.players
            .map(
              (player) => Chip(
                label: Text(
                  player,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white70),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
