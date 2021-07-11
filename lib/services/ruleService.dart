import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/ruleSection.dart';

class RuleService {
  static List<RuleChapter> getChapters() {
    return [
      RuleChapter(
        title: 'ruleChapterIntroductionTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionIntroductionTitle',
            paragraphs: [
              'ruleChapterIntroductionParagraph1',
              'ruleChapterIntroductionParagraph2',
            ],
          ),
          RuleSection(
            title: 'ruleSectionCooperativeTitle',
            paragraphs: [
              'ruleSectionCooperativeParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionMissionSystemTitle',
            paragraphs: [
              'ruleSectionMissionSystemParagraph1',
              'ruleSectionMissionSystemParagraph2',
            ],
          ),
          RuleSection(
            title: 'ruleSectionSetOfFoldTitle',
            paragraphs: [
              'ruleSectionSetOfFoldParagraph1',
              'ruleSectionSetOfFoldParagraph2',
              'ruleSectionSetOfFoldParagraph3',
              'ruleSectionSetOfFoldParagraph4',
              'ruleSectionSetOfFoldParagraph5',
            ],
          ),
          RuleSection(
            title: 'ruleSectionCommunicationTitle',
            paragraphs: [
              'ruleSectionCommunicationParagraph1',
              'ruleSectionCommunicationParagraph2',
              'ruleSectionCommunicationParagraph3',
              'ruleSectionCommunicationParagraph4',
              'ruleSectionCommunicationParagraph5',
              'ruleSectionCommunicationParagraph6',
              'ruleSectionCommunicationParagraph7',
              'ruleSectionCommunicationParagraph8',
            ],
          ),
        ],
      ),
      RuleChapter(
        title: 'ruleChapterMaterialTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionSpaceCardTitle',
            paragraphs: [
              'ruleSectionSpaceCardParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionReminderCardTitle',
            paragraphs: [
              'ruleSectionReminderCardParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionTaskCardTitle',
            paragraphs: [
              'ruleSectionTaskCardParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionTokenTitle',
            paragraphs: [
              'ruleSectionTokenParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionCommanderPawnTitle',
            paragraphs: [
              'ruleSectionCommanderPawnParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionLogbookTitle',
            paragraphs: [
              'ruleSectionLogbookParagraph1',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterMissionPreparationTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionMissionPreparationTitle',
            paragraphs: [
              'ruleSectionMissionPreparationParagraph1',
              'ruleSectionMissionPreparationParagraph2',
              'ruleSectionMissionPreparationParagraph3',
              'ruleSectionMissionPreparationParagraph4',
              'ruleSectionMissionPreparationParagraph5',
              'ruleSectionMissionPreparationParagraph6',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterMissionProgressTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionMissionProgressTitle',
            paragraphs: [
              'ruleSectionMissionProgressParagraph1',
              'ruleSectionMissionProgressParagraph2',
              'ruleSectionMissionProgressParagraph3',
              'ruleSectionMissionProgressParagraph4',
              'ruleSectionMissionProgressParagraph5',
              'ruleSectionMissionProgressParagraph6',
              'ruleSectionMissionProgressParagraph7',
              'ruleSectionMissionProgressParagraph8',
              'ruleSectionMissionProgressParagraph9',
              'ruleSectionMissionProgressParagraph10',
              'ruleSectionMissionProgressParagraph11',
              'ruleSectionMissionProgressParagraph12',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterDifficultyLevelTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionDifficultyLevelTitle',
            paragraphs: [
              'ruleSectionDifficultyLevelParagraph1',
              'ruleSectionDifficultyLevelParagraph2',
              'ruleSectionDifficultyLevelParagraph3',
              'ruleSectionDifficultyLevelParagraph4',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterDistressSignalTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionDistressSignalTitle',
            paragraphs: [
              'ruleSectionDistressSignalParagraph1',
              'ruleSectionDistressSignalParagraph2',
              'ruleSectionDistressSignalParagraph3',
              'ruleSectionDistressSignalParagraph4',
              'ruleSectionDistressSignalParagraph5',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterLogbookSymbolsTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionTaskPawnTitle',
            paragraphs: [
              'ruleSectionTaskPawnParagraph1',
              'ruleSectionTaskPawnParagraph2',
              'ruleSectionTaskPawnParagraph3',
              'ruleSectionTaskPawnParagraph4',
              'ruleSectionTaskPawnParagraph5',
              'ruleSectionTaskPawnParagraph6',
              'ruleSectionTaskPawnParagraph7',
            ],
          ),
          RuleSection(
            title: 'ruleSectionSilenceZoneTitle',
            paragraphs: [
              'ruleSectionSilenceZoneParagraph1',
            ],
          ),
          RuleSection(
            title: 'ruleSectionDisturbanceTitle',
            paragraphs: [
              'ruleSectionDisturbanceParagraph1',
              'ruleSectionDisturbanceParagraph2',
            ],
          ),
          RuleSection(
            title: 'ruleSectionCommanderDecisionTitle',
            paragraphs: [
              'ruleSectionCommanderDecisionParagraph1',
              'ruleSectionCommanderDecisionParagraph2',
            ],
          ),
          RuleSection(
            title: 'ruleSectionCommanderTourTitle',
            paragraphs: [
              'ruleSectionCommanderTourParagraph1',
              'ruleSectionCommanderTourParagraph2',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterFivePlayerPartyTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionFivePlayerPartyTitle',
            paragraphs: [
              'ruleSectionFivePlayerPartyParagraph1',
              'ruleSectionFivePlayerPartyParagraph2',
              'ruleSectionFivePlayerPartyParagraph3',
              'ruleSectionFivePlayerPartyParagraph4',
              'ruleSectionFivePlayerPartyParagraph5',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterTwoPlayerPartyTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionTwoPlayerPartyTitle',
            paragraphs: [
              'ruleSectionTwoPlayerPartyParagraph1',
              'ruleSectionTwoPlayerPartyParagraph2',
              'ruleSectionTwoPlayerPartyParagraph3',
              'ruleSectionTwoPlayerPartyParagraph4',
              'ruleSectionTwoPlayerPartyParagraph5',
              'ruleSectionTwoPlayerPartyParagraph6',
              'ruleSectionTwoPlayerPartyParagraph7',
              'ruleSectionTwoPlayerPartyParagraph8',
              'ruleSectionTwoPlayerPartyParagraph9',
              'ruleSectionTwoPlayerPartyParagraph10',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterTipsAndVariantsTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionTipsAndVariantsTitle',
            paragraphs: [
              'ruleSectionTipsAndVariantsParagraph1',
              'ruleSectionTipsAndVariantsParagraph2',
              'ruleSectionTipsAndVariantsParagraph3',
              'ruleSectionTipsAndVariantsParagraph4',
              'ruleSectionTipsAndVariantsParagraph5',
              'ruleSectionTipsAndVariantsParagraph6',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterThreePlayerChallengeTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionThreePlayerChallengeTitle',
            paragraphs: [
              'ruleSectionThreePlayerChallengeParagraph1',
              'ruleSectionThreePlayerChallengeParagraph2',
              'ruleSectionThreePlayerChallengeParagraph3',
              'ruleSectionThreePlayerChallengeParagraph4',
            ],
          )
        ],
      ),
      RuleChapter(
        title: 'ruleChapterAuthorTitle',
        sections: [
          RuleSection(
            title: 'ruleSectionAuthorTitle',
            paragraphs: [
              'ruleSectionAuthorParagraph1',
              'ruleSectionAuthorParagraph2',
              'ruleSectionAuthorParagraph3',
            ],
          )
        ],
      ),
    ];
  }
}
