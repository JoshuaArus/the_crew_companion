import 'package:flutter_test/flutter_test.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';

void main() {
  group('controller', () {
    test('init() : initialize data from shared preferences', () async {
      var controller = Controller();

      var storageKey = "com.joshuaarus.the_crew_companion";
      expect(controller.storageKey, storageKey);
      expect(controller.settingsKey, storageKey + "_settings");
      expect(controller.teamsKey, storageKey + "_teams");

      // await controller.init();
      // verify(controller.readSettings()).called(1);
      // verify(controller.readTeams()).called(1);
    });

    test('populateRules() : populate the list of rules', () {
      var controller = Controller();

      expect(controller.rules, isA<List<RuleChapter>>());
      expect(controller.rules.length, 0);

      controller.populateRules();

      // verify(RuleService.getChapters()).called(1);

      expect(controller.rules, isA<List<RuleChapter>>());
      expect(controller.rules.length, 12);
    });

    test('populateMissions() : populate the list of missions', () {
      var controller = Controller();

      expect(controller.missions, isA<List<Mission>>());
      expect(controller.missions.length, 0);

      controller.populateMissions();

      // verify(MissionService.getMissions()).called(1);

      expect(controller.missions, isA<List<Mission>>());
      expect(controller.missions.length, 50);
    });
  });
}
