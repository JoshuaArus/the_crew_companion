import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/customMarkdownBody.dart';

class Rules extends StatelessWidget {
  const Rules({required this.controller});

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('gameRules')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CustomMarkdownBody(
                data: AppLocalizations.translate('commonUnderConstruction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
