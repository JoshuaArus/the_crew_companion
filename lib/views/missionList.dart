import 'package:flutter/material.dart';

import '../controller.dart';

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
      body: Container(
        child: Text("")
      )
    );
  }
}