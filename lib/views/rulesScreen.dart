import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/ruleScreen.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({required this.controller});

  final Controller controller;

  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  void _goToRule(RuleChapter rule) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => RuleScreen(
          rule: rule,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('gameRules')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: FutureBuilder(
            future: widget.controller.populateRules(),
            builder: (context, snapshot) {
              return Column(
                children: widget.controller.rules
                    .map((ruleChapter) => Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: primaryColor),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              AppLocalizations.translate(ruleChapter.title),
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: FaIcon(
                              FontAwesomeIcons.chevronRight,
                            ),
                            onTap: () => _goToRule(ruleChapter),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
