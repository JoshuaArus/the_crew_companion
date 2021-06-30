import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/ruleSection.dart';

class Rule {
  static List<RuleChapter> getChapters() {
    return [
      RuleChapter(
        title: 'ruleChapterIntroductionTitle',
        sections: [
          RuleSection(title: 'ruleSectionIntroductionTitle', paragraphs: [
            'ruleChapterIntroductionParagraph1',
            'ruleChapterIntroductionParagraph2'
          ]),
          RuleSection(
              title: 'ruleSectionCooperativeTitle',
              paragraphs: ['ruleSectionCooperativeParagraph1']),
          RuleSection(title: 'ruleSectionMissionSystemTitle', paragraphs: [
            'ruleSectionMissionSystemParagraph1',
            'ruleSectionMissionSystemParagraph2'
          ]),
          RuleSection(title: 'ruleSectionSetOfFoldTitle', paragraphs: [
            'ruleSectionSetOfFoldParagraph1',
            'ruleSectionSetOfFoldParagraph2',
            'ruleSectionSetOfFoldParagraph3',
            'ruleSectionSetOfFoldParagraph4',
            'ruleSectionSetOfFoldParagraph5',
          ]),
          RuleSection(title: 'ruleSectionCommunicationTitle', paragraphs: [
            'ruleSectionCommunicationParagraph1',
            'ruleSectionCommunicationParagraph2',
            'ruleSectionCommunicationParagraph3',
            'ruleSectionCommunicationParagraph4',
            'ruleSectionCommunicationParagraph5',
            'ruleSectionCommunicationParagraph6',
            'ruleSectionCommunicationParagraph7',
            'ruleSectionCommunicationParagraph8',
          ]),
        ],
      ),
      RuleChapter(title: 'ruleChapterMaterialTitle', sections: [
        RuleSection(
            title: 'ruleSectionSpaceCardTitle',
            paragraphs: ['ruleSectionSpaceCardParagraph1']),
        RuleSection(
            title: 'ruleSectionReminderCardTitle',
            paragraphs: ['ruleSectionReminderCardParagraph1']),
        RuleSection(
            title: 'ruleSectionTaskCardTitle',
            paragraphs: ['ruleSectionTaskCardParagraph1']),
        RuleSection(
            title: 'ruleSectionTokenTitle',
            paragraphs: ['ruleSectionTokenParagraph1']),
        RuleSection(
            title: 'ruleSectionCommanderPawnTitle',
            paragraphs: ['ruleSectionCommanderPawnParagraph1']),
        RuleSection(
            title: 'ruleSectionLogbookTitle',
            paragraphs: ['ruleSectionLogbookParagraph1'])
      ]),
      RuleChapter(title: 'ruleChapterMissionPreparationTitle', sections: []),
      RuleChapter(title: 'ruleChapterMissionProgressTitle', sections: []),
      RuleChapter(title: 'ruleChapterDifficultyLevelTitle', sections: []),
      RuleChapter(title: 'ruleChapterDistressSignalTitle', sections: []),
      RuleChapter(title: 'ruleChapterLogbookSymbolsTitle', sections: []),
      RuleChapter(title: 'ruleChapterFivePlayerPartyTitle', sections: []),
      RuleChapter(title: 'ruleChapterTwoPlayerPartyTitle', sections: []),
      RuleChapter(title: 'ruleChapterTipsAndVariantsTitle', sections: []),
      RuleChapter(title: 'ruleChapterThreePlayerChallengeTitle', sections: []),
    ];
  }
}
