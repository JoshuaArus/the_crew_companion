import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/ruleSection.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/customMarkdownBody.dart';

class RuleScreen extends StatefulWidget {
  RuleScreen({required this.rule});

  final RuleChapter rule;

  @override
  _RuleScreenState createState() => _RuleScreenState();
}

class _RuleScreenState extends State<RuleScreen> {
  List<Widget> buildRuleSection(RuleSection ruleSection) {
    List<Widget> children = [
      Container(
        margin: EdgeInsets.only(bottom: defaultPadding),
        child: Text(
          AppLocalizations.translate(ruleSection.title),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    ];

    children.addAll(
      ruleSection.paragraphs.map(
        (ruleSectionParagraph) => Container(
          margin: EdgeInsets.only(bottom: defaultPadding),
          child: CustomMarkdownBody(
            data: AppLocalizations.translate(ruleSectionParagraph),
          ),
        ),
      ),
    );

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate(widget.rule.title),
            overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: widget.rule.sections
                .map(
                  (ruleSection) => Container(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      top: defaultPadding,
                      right: defaultPadding,
                    ),
                    margin: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: primaryColor),
                      ),
                      color: secondaryColor,
                      shape: BoxShape.rectangle,
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
      ),
    );
  }
}
