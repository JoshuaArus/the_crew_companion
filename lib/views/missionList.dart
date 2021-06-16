import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';

import '../controller.dart';
import 'components/missionExpansionPanelList.dart';

class MissionList extends StatefulWidget {
  const MissionList({ Key? key, required this.controller }) : super(key: key);

  final Controller controller;

  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des missions"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: MissionExpansionPanelList(
            missions: widget.controller.missions,
          )
        )
      )
    );
  }
}