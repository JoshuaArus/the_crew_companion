import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

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
        return AppLocalizations.translate('commonOrder', {'order': "1"});
      case AimOption.Two:
        return AppLocalizations.translate('commonOrder', {'order': "2"});
      case AimOption.Three:
        return AppLocalizations.translate('commonOrder', {'order': "3"});
      case AimOption.Four:
        return AppLocalizations.translate('commonOrder', {'order': "4"});
      case AimOption.Five:
        return AppLocalizations.translate('commonOrder', {'order': "5"});
      case AimOption.First:
        return AppLocalizations.translate('commonPriority', {'priority': "1"});
      case AimOption.Second:
        return AppLocalizations.translate('commonPriority', {'priority': "2"});
      case AimOption.Third:
        return AppLocalizations.translate('commonPriority', {'priority': "3"});
      case AimOption.Fourth:
        return AppLocalizations.translate('commonPriority', {'priority': "4"});
      case AimOption.Last:
        return AppLocalizations.translate('commonLast');
      case AimOption.Comms:
        return AppLocalizations.translate('commonDisruptedCommunications');
      case AimOption.Hidden:
        return AppLocalizations.translate('commonFaceDownCards');
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
          style: CustomTheme.current.primaryTextTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        );
      case AimOption.First:
        return Row(children: _generateChevrons(1));
      case AimOption.Second:
        return Row(children: _generateChevrons(2));
      case AimOption.Third:
        return Row(children: _generateChevrons(3));
      case AimOption.Fourth:
        return Row(children: _generateChevrons(4));
      case AimOption.Last:
        return Image.asset(
          "assets/images/omega.png",
          color: CustomTheme.current.primaryTextTheme.bodyText2!.color,
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
            color: CustomTheme.current.primaryTextTheme.bodyText2!.color,
          ),
        );
    }
  }

  List<Widget> _generateChevrons(int nb) {
    return List.filled(
      nb,
      FaIcon(
        FontAwesomeIcons.chevronRight,
        color: CustomTheme.current.primaryTextTheme.bodyText2!.color,
      ),
    );
  }
}
