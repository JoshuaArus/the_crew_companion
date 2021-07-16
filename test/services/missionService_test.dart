import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_crew_companion/services/missionService.dart';

void main() {
  group('missionService', () {
    test('getMissions : return a list of 50 missions', () {
      var missionList = MissionService.getMissions();

      expect(missionList.length, 50);

      missionList.forEach((mission) {
        expect(mission.title, isA<String>());
        expect(mission.title, isNotEmpty);

        expect(mission.description, isA<String>());
        expect(mission.description, isNotEmpty);
      });
    });
  });
}
