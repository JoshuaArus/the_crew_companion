import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';
import 'package:the_crew_companion/views/screens/ruleScreen.dart';

class RulesScreen extends LandscapableScreen {
  const RulesScreen({required Controller controller})
      : super(controller: controller);

  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen>
    with LandscapableScreenState {
  void _goToRule(RuleChapter rule) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => RuleScreen(
          controller: widget.controller,
          rule: rule,
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('gameRules')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: FutureBuilder(
            future: widget.controller.populateRules(),
            builder: (context, snapshot) {
              return Column(
                children: widget.controller.rules
                    .map((ruleChapter) => Container(
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            border: Border(
                              bottom: BorderSide(color: primaryColor),
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              AppLocalizations.translate(ruleChapter.title),
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: const FaIcon(
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
