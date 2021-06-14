
import 'package:localstorage/localstorage.dart';

import 'entities/mission.dart';
import 'entities/team.dart';
import 'story.dart';

class Controller {
  final List<Team> teams = [];
  final List<Mission> missions = Story.missions;
}