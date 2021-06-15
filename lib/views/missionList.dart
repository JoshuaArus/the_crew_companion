import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/views/components/playGameComponents.dart';

import '../controller.dart';

class MissionList extends StatefulWidget {
  const MissionList({ Key? key, required this.controller }) : super(key: key);

  final Controller controller;

  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {

  List<bool> isOpen = [];

  void _expand(int index, bool isExpanded) {
    setState(() {
      isOpen[index] = !isExpanded;
    });    
  }

  @override
  Widget build(BuildContext context) {
    if (isOpen.length == 0)
      isOpen = widget.controller.missions.map((e) => false).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des missions"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: ExpansionPanelList(
            expansionCallback: _expand,
            children: widget.controller.missions.map((mission) {
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
                    children: [
                      Text(mission.description),
                      Padding(padding: EdgeInsets.all(defaultPadding)),
                      MissionAims(currentMission: mission)
                    ],
                  ),
                ),
                isExpanded: isOpen[mission.id]
              );
            }).toList()
          )
        )
      )
    );
  }
}