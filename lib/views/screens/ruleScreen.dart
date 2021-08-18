import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/ruleSection.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/customMarkdownBody.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class RuleScreen extends LandscapableScreen {
  const RuleScreen({required this.rule, required Controller controller})
      : super(controller: controller);

  final RuleChapter rule;

  @override
  _RuleScreenState createState() => _RuleScreenState();
}

class _RuleScreenState extends State<RuleScreen> with LandscapableScreenState {
  List<Widget> buildRuleSection(RuleSection ruleSection) {
    final List<Widget> children = [
      Container(
        margin: const EdgeInsets.only(bottom: defaultPadding),
        child: Text(
          AppLocalizations.translate(ruleSection.title),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    ];

    children.addAll(
      ruleSection.paragraphs.map(
        (ruleSectionParagraph) => Container(
          margin: const EdgeInsets.only(bottom: defaultPadding),
          child: CustomMarkdownBody(
            data: AppLocalizations.translate(ruleSectionParagraph),
          ),
        ),
      ),
    );

    return children;
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate(widget.rule.title),
            overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.rule.sections
              .map(
                (ruleSection) => Container(
                  padding: const EdgeInsets.only(
                    left: defaultPadding,
                    top: defaultPadding,
                    right: defaultPadding,
                  ),
                  margin: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: primaryColor),
                    ),
                    color: secondaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: buildRuleSection(ruleSection),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
