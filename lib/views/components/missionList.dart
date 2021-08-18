import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/missionExpansionPanelList.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class MissionList extends LandscapableScreen {
  const MissionList({required Controller controller})
      : super(controller: controller);

  @override
  _MissionListState createState() => _MissionListState();
}

class _MissionListState extends State<MissionList>
    with LandscapableScreenState {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('missionList')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: MissionExpansionPanelList(
            missions: widget.controller.missions,
          ),
        ),
      ),
    );
  }
}
