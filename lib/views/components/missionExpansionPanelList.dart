import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/utils/stringFormatter.dart';
import 'package:the_crew_companion/views/components/missionDescription.dart';

class MissionExpansionPanelList extends StatefulWidget {
  const MissionExpansionPanelList(
      {required this.missions, this.expandedMissionId});

  final List<Mission> missions;
  final int? expandedMissionId;

  @override
  _MissionExpansionPanelListState createState() =>
      _MissionExpansionPanelListState();
}

class _MissionExpansionPanelListState extends State<MissionExpansionPanelList> {
  int? expandedMissionId;

  @override
  void initState() {
    super.initState();
    expandedMissionId = widget.expandedMissionId;
  }

  void _expand(int index, bool isExpanded) {
    setState(() {
      expandedMissionId = !isExpanded ? widget.missions[index].id : null;
    });
  }

  List<Widget> buildChildrens(Mission mission) {
    final List<Widget> children = [
      MissionDescription(mission: mission),
    ];

    if (mission.attempts > 0) {
      children.addAll([
        const Divider(),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppLocalizations.translate('commonAttempts')} : "),
            Text(
              mission.attempts.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppLocalizations.translate('commonSatellite')} : "),
            Switch(
              thumbColor: MaterialStateProperty.resolveWith(getStateColor),
              trackColor: MaterialStateProperty.resolveWith(getStateFadedColor),
              value: mission.satelliteUsed,
              onChanged: null,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${AppLocalizations.translate('gameTimeElapsed')} : "),
            Text(
              mission.durationInSeconds == null
                  ? "-"
                  : StringFormatter.formatDuration(
                      Duration(seconds: mission.durationInSeconds!),
                    ),
            ),
          ],
        ),
        if (mission.comment != null && mission.comment! != "")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${AppLocalizations.translate('commonComments')} : "),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white30, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(defaultPadding),
                margin: const EdgeInsets.only(
                  top: defaultPadding,
                  bottom: defaultPadding,
                ),
                child: Text(
                  mission.comment!,
                ),
              )
            ],
          ),
      ]);
    }

    return children;
  }

  Color? getStateColor(Set<MaterialState> states) {
    const Set<MaterialState> activeStates = {MaterialState.selected};
    return states.any((element) => activeStates.contains(element))
        ? primaryColor
        : null;
  }

  Color? getStateFadedColor(Set<MaterialState> states) {
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
            isExpanded: mission.id == expandedMissionId,
          );
        },
      ).toList(),
    );
  }
}
