import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/services/missionService.dart';
import 'package:the_crew_companion/services/ruleService.dart';

import 'controller_test.mocks.dart';

@GenerateMocks([Controller, RuleService, MissionService])
void main() {
  group('controller', () {
    final mockRuleService = MockRuleService();

    when(mockRuleService.getChapters()).thenAnswer(
      (_) => RuleService().getChapters(),
    );

    final mockMissionService = MockMissionService();

    when(mockMissionService.getMissions()).thenAnswer(
      (_) => MissionService().getMissions(),
    );

    final controller = Controller(
      ruleService: mockRuleService,
      missionService: mockMissionService,
    );

    test('init() : initialize data from shared preferences', () async {
      var storageKey = "com.joshuaarus.the_crew_companion";

      expect(controller.storageKey, storageKey);
      expect(controller.settingsKey, storageKey + "_settings");
      expect(controller.teamsKey, storageKey + "_teams");
    });

    test('populateRules() : populate the list of rules', () async {
      expect(controller.rules, isA<List<RuleChapter>>());
      expect(controller.rules.length, 0);

      await controller.populateRules();
      verify(mockRuleService.getChapters()).called(1);

      expect(controller.rules, isA<List<RuleChapter>>());
      expect(controller.rules.length, isNot(0));
    });

    test('populateRules() : rules list is only populated once', () async {
      var ruleCount = controller.rules.length;
      expect(controller.rules.length, ruleCount);
      await controller.populateRules();
      verifyNever(mockRuleService.getChapters());
      expect(controller.rules.length, ruleCount);
    });

    test('populateMissions() : populate the list of missions', () async {
      expect(controller.missions, isA<List<Mission>>());
      expect(controller.missions.length, 0);

      await controller.populateMissions();
      verify(mockMissionService.getMissions()).called(1);

      expect(controller.missions, isA<List<Mission>>());
      expect(controller.missions.length, isNot(0));
    });

    test('populateMissions() : missions list is only populated once', () async {
      var missionCount = controller.missions.length;
      expect(controller.missions.length, missionCount);
      await controller.populateMissions();
      verifyNever(mockMissionService.getMissions());
      expect(controller.missions.length, missionCount);
    });
  });
}
