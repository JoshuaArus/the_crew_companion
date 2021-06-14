import "package:flutter/material.dart";
import 'package:the_crew_companion/entities/team.dart';

import '../../constant.dart';

class TeamProgress extends StatelessWidget {
  const TeamProgress({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Text(
      team.achievedMissions.length > 0
          ? team.achievedMissions.last.title
          : "Partie non commencée !",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: Colors.white70),
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
    return Text(
      team.players.join(" - "),
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: Colors.white70),
    );
  }
}

class TeamName extends StatelessWidget {
  const TeamName({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Text(
      team.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .headline3,
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
        padding:
            EdgeInsets.symmetric(horizontal: defaultPadding),
        child: child
      )
    );
  }
}