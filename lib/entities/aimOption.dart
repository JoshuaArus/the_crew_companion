import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_crew_companion/customThemes.dart';

enum AimOption {
  One,
  Two,
  Three,
  Four,
  Five,
  First,
  Second,
  Third,
  Fourth,
  Last,
  Comms,
  Hidden
}

class AimOptionFactory {
  static AimOption fromString(String val) {
    return AimOption.values.firstWhere((element) => element.toString() == val);
  }
}

extension AimOptionExtension on AimOption {
  String get displayValue {
    switch (this) {
      case AimOption.One:
        return "1";
      case AimOption.Two:
        return "2";
      case AimOption.Three:
        return "3";
      case AimOption.Four:
        return "4";
      case AimOption.Five:
        return "5";
      case AimOption.First:
        return ">";
      case AimOption.Second:
        return ">>";
      case AimOption.Third:
        return ">>>";
      case AimOption.Fourth:
        return ">>>>";
      case AimOption.Last:
        return "Ω";
      case AimOption.Comms:
        return "©";
      case AimOption.Hidden:
        return "⟲";
    }
  }

  String get tooltip {
    switch (this) {
      case AimOption.One:
        return "Ordre 1";
      case AimOption.Two:
        return "Ordre 2";
      case AimOption.Three:
        return "Ordre 3";
      case AimOption.Four:
        return "Ordre 4";
      case AimOption.Five:
        return "Ordre 5";
      case AimOption.First:
        return "Priorité 1";
      case AimOption.Second:
        return "Priorité 2";
      case AimOption.Third:
        return "Priorité 3";
      case AimOption.Fourth:
        return "Priorité 4";
      case AimOption.Last:
        return "En dernier";
      case AimOption.Comms:
        return "Communications perturbées";
      case AimOption.Hidden:
        return "Cartes faces cachées";
    }
  }

  Widget get icon {
    switch (this) {
      case AimOption.One:
      case AimOption.Two:
      case AimOption.Three:
      case AimOption.Four:
      case AimOption.Five:
        return Text(
          this.displayValue,
          style: CustomThemes.dark.primaryTextTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        );
      case AimOption.First:
        return Row(children: generateChevrons(1));
      case AimOption.Second:
        return Row(children: generateChevrons(2));
      case AimOption.Third:
        return Row(children: generateChevrons(3));
      case AimOption.Fourth:
        return Row(children: generateChevrons(4));
      case AimOption.Last:
        return Image.asset(
          "assets/images/omega.png",
          color: CustomThemes.dark.primaryTextTheme.bodyText2!.color,
        );
      case AimOption.Comms:
        return FaIcon(
          FontAwesomeIcons.userAstronaut,
          color: Colors.red[900],
        );
      case AimOption.Hidden:
        return Transform.rotate(
          angle: -45,
          child: FaIcon(
            FontAwesomeIcons.undoAlt,
            color: CustomThemes.dark.primaryTextTheme.bodyText2!.color,
          ),
        );
    }
  }

  List<Widget> generateChevrons(int nb) {
    return List.filled(
      nb,
      FaIcon(
        FontAwesomeIcons.chevronRight,
        color: CustomThemes.dark.primaryTextTheme.bodyText2!.color,
      ),
    );
  }
}
