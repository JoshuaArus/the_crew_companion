import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_crew_companion/entities/ruleSection.dart';
import 'package:the_crew_companion/services/ruleService.dart';

void main() {
  group('ruleService', () {
    test('getRules : return a list of 12 chapters', () {
      var chapterList = RuleService.getChapters();

      expect(chapterList.length, 12);

      chapterList.forEach((chapter) {
        expect(chapter.title, isA<String>());
        expect(chapter.sections, isA<List<RuleSection>>());
      });
    });
  });
}
