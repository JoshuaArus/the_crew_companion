import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/views/components/delayedAnimation.dart';
import 'package:the_crew_companion/views/components/fallingAsteroids.dart';
import 'package:the_crew_companion/views/components/jumpingHomeScreenTitle.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({required this.controller});

  final Controller controller;

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    String version = widget.controller.appVersion;
    String developper = widget.controller.developper;

    return Scaffold(
      appBar: AppBar(
        title: Text("A propos"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homeScreenBackground.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            FallingAsteroids(
              asteroidNumber: 5,
            ),
            Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: DelayedAnimation(
                        delay: 1000,
                        child: JumpingHomeScreenTitle(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding * 2),
                      margin: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: secondaryColor.withOpacity(0.90),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MarkdownBody(
                            data:
                                "Application mobile non officielle permettant de remplacer le carnet du jeu [The Crew](https://boardgamegeek.com/boardgame/284083/crew-quest-planet-nine) et de suivre les parties réalisées.",
                            styleSheet: MarkdownStyleSheet(
                              textAlign: WrapAlignment.spaceEvenly,
                              p: TextStyle(
                                height: 2,
                              ),
                            ),
                            onTapLink: (text, url, title) {
                              launch(url!);
                            },
                          ),
                          Text("Développé par " + developper),
                          MarkdownBody(
                            data:
                                "Suivre le projet sur [github](https://github.com/JoshuaArus/the_crew_companion/)",
                            styleSheet: MarkdownStyleSheet(
                              textAlign: WrapAlignment.spaceEvenly,
                              p: TextStyle(
                                height: 2,
                              ),
                            ),
                            onTapLink: (text, url, title) {
                              launch(url!);
                            },
                          ),
                          Text("Version " + version),
                        ],
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
