import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/missionExpansionPanelList.dart';

class MissionList extends StatefulWidget {
  const MissionList({required this.controller});

  final Controller controller;

  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('missionList')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: MissionExpansionPanelList(
            missions: widget.controller.missions,
          ),
        ),
      ),
    );
  }
}
