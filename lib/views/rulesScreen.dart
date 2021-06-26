import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

class Rules extends StatelessWidget {
  const Rules({required this.controller});

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.instance!.translate('gameRules')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MarkdownBody(
                data: AppLocalizations.instance!.translate('commonUnderConstruction'),
                styleSheet: MarkdownStyleSheet(
                  textAlign: WrapAlignment.center,
                  p: TextStyle(
                    height: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
