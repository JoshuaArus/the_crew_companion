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