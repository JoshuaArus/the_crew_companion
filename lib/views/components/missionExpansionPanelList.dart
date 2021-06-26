import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/views/components/missionDescription.dart';

// ignore: must_be_immutable
class MissionExpansionPanelList extends StatefulWidget {
  MissionExpansionPanelList({required this.missions, this.expandedMissionId});

  final List<Mission> missions;
  int? expandedMissionId;

  @override
  _MissionExpansionPanelListState createState() =>
      _MissionExpansionPanelListState();
}

class _MissionExpansionPanelListState extends State<MissionExpansionPanelList> {
  void _expand(int index, bool isExpanded) {
    setState(() {
      widget.expandedMissionId = !isExpanded ? index : null;
    });
  }

  List<Widget> buildChildrens(Mission mission) {
    List<Widget> children = [
      MissionDescription(mission: mission),
    ];

    if (mission.attempts > 0) {
      children.addAll([
        Divider(),
        SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.commonAttempts + " : "),
            Text(
              mission.attempts.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.commonSatellite + " : "),
            Switch(
              thumbColor: MaterialStateProperty.resolveWith(getStateColor),
              trackColor: MaterialStateProperty.resolveWith(getStateFadedColor),
              value: mission.satelliteUsed,
              onChanged: null,
            )
          ],
        )
      ]);
    }

    return children;
  }

  Color? getStateColor(states) {
    const Set<MaterialState> activeStates = {MaterialState.selected};
    return states.any((element) => activeStates.contains(element))
        ? primaryColor
        : null;
  }

  Color? getStateFadedColor(states) {
    return getStateColor(states)?.withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: _expand,
      dividerColor: primaryColor,
      children: widget.missions.map(
        (mission) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isOpen) {
              return ListTile(
                title: Text(mission.title),
              );
            },
            body: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildChildrens(mission),
              ),
            ),
            isExpanded: mission.id == widget.expandedMissionId,
          );
        },
      ).toList(),
    );
  }
}
