import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller.dart';

class About extends StatefulWidget {
  const About({Key? key, required this.controller}) : super(key: key);

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
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/homeScreenBackground.png"),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 270),
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: secondaryColor.withOpacity(0.7),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      ),
    );
  }
}
