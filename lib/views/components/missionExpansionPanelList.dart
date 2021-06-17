import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';

import 'missionDescription.dart';

// ignore: must_be_immutable
class MissionExpansionPanelList extends StatefulWidget {
  MissionExpansionPanelList({ Key? key, required this.missions, this.expandedMissionId }) : super(key: key);

  final List<Mission> missions;
  int? expandedMissionId;

  @override
  _MissionExpansionPanelListState createState() => _MissionExpansionPanelListState();
}

class _MissionExpansionPanelListState extends State<MissionExpansionPanelList> {

  List<bool> isOpen = [];

  void _expand(int index, bool isExpanded) {
    setState(() {
      isOpen[index] = !isExpanded;
    });    
  }

  List<Widget> buildChildrens(Mission mission) {
    List<Widget> children = [
      MissionDescription(mission: mission),
    ];

    if (mission.attempts > 0) {
      children.addAll([
        Divider(
        ),
        Padding(padding: EdgeInsets.only(top: defaultPadding)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tentatives : "),
            Text(
              mission.attempts.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Satellite : "),
            Switch(
                thumbColor: MaterialStateProperty.resolveWith(getStateColor),
                trackColor: MaterialStateProperty.resolveWith(getStateFadedColor),
                value: mission.satelliteUsed,
                onChanged: null)
          ],
        )
      ]);
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    if (isOpen.length == 0)
      isOpen = widget.missions.map((e) => widget.expandedMissionId == e.id).toList();
    return ExpansionPanelList(
      expansionCallback: _expand,
      dividerColor: primaryColor,
      children: widget.missions.map((mission) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isOpen) {
            return ListTile(
              title: Text(mission.title)
            );
          },
          body: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildChildrens(mission),
            )
          ),
          isExpanded: isOpen[mission.id]
          
        );
      }).toList()
    );
  }

  Color? getStateColor(states) {
      const Set<MaterialState> activeStates = {MaterialState.selected};
      return states.any((element) => activeStates.contains(element)) ? primaryColor : null;
  }

  Color? getStateFadedColor(states) {
      return getStateColor(states)?.withOpacity(0.5);
  }
}

