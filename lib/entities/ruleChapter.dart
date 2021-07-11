import 'package:the_crew_companion/entities/ruleSection.dart';

class RuleChapter {
  String title;
  List<RuleSection> sections;

  RuleChapter({
    required this.title,
    required this.sections,
  });
}
