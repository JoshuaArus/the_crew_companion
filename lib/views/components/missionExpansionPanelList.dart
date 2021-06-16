import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/views/components/playGameComponents.dart';

// ignore: must_be_immutable
class MissionExpansionPanelList extends StatefulWidget {
  MissionExpansionPanelList({ Key? key, required this.missions, int? expandedMissionId }) : super(key: key);

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
            title: MissionDescription(mission: mission),
          ),
          isExpanded: isOpen[mission.id]
          
        );
      }).toList()
    );
  }
}