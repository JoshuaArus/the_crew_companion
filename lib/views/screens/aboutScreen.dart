import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/views/components/customMarkdownBody.dart';
import 'package:the_crew_companion/views/components/delayedAnimation.dart';
import 'package:the_crew_companion/views/components/fallingAsteroids.dart';
import 'package:the_crew_companion/views/components/jumpingHomeScreenTitle.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class AboutScreen extends LandscapableScreen {
  const AboutScreen({required Controller controller})
      : super(controller: controller);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with LandscapableScreenState {
  List<String> contributors = [
    "[Joshua Arus](https://github.com/JoshuaArus)",
    "[Maxime Rauch](https://github.com/schnapse)",
  ];

  @override
  Widget buildBody(BuildContext context) {
    final String version = widget.controller.appVersion;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('aboutTitle')),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homeScreenBackground.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            const FallingAsteroids(
              // ignore: avoid_redundant_argument_values
              asteroidNumber: 5,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: const DelayedAnimation(
                        delay: 1000,
                        child: JumpingHomeScreenTitle(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(defaultPadding * 2),
                        margin: const EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          color: secondaryColor.withOpacity(0.90),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomMarkdownBody(
                              data: AppLocalizations.translate(
                                  'aboutPresentation'),
                            ),
                            CustomMarkdownBody(
                              data:
                                  "${AppLocalizations.translate('aboutDevelopedBy')} : ${contributors.join(" - ")}",
                            ),
                            CustomMarkdownBody(
                              data: AppLocalizations.translate(
                                  'aboutFollowProject'),
                            ),
                            Text(
                                "${AppLocalizations.translate('aboutVersion')} $version"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
