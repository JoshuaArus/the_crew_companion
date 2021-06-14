import 'package:flutter/material.dart';

class TeamList extends StatefulWidget {
  TeamList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  int _counter = 0;

  List<Team> teams = [
    Team("Team 1"),
    Team("Team 2"),
    Team("Team 3")
  ];

  void _addTeam() {
    setState(() {
      teams.add(Team("Team " + teams.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _addTeam method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the TeamList object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        new Expanded(
          child: new ListView.builder(
            itemCount: teams.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Text(teams[index].name);
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        tooltip: 'Add team',
        child: Icon(Icons.add),
      ),
    );
  }
}
