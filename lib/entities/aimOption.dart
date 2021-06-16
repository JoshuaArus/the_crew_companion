import 'package:flutter/material.dart';

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
  Disturbance,
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
      case AimOption.One :
        return "1";
      case AimOption.Two: 
        return "2";
      case AimOption.Three : 
        return "3";
      case AimOption.Four : 
        return "4";
      case AimOption.Five : 
        return "5";
      case AimOption.First : 
        return ">";
      case AimOption.Second : 
        return ">>";
      case AimOption.Third : 
        return ">>>";
      case AimOption.Fourth : 
        return ">>>>";
      case AimOption.Last : 
        return "Ω";
      case AimOption.Disturbance : 
        return "🕬";
      case AimOption.Hidden : 
        return "⟲";
    }
  }

  String get tooltip {
    switch (this) {
      case AimOption.One :
        return "Ordre 1";
      case AimOption.Two: 
        return "Ordre 2";
      case AimOption.Three : 
        return "Ordre 3";
      case AimOption.Four : 
        return "Ordre 4";
      case AimOption.Five : 
        return "Ordre 5";
      case AimOption.First : 
        return "Priorité 1";
      case AimOption.Second : 
        return "Priorité 2";
      case AimOption.Third : 
        return "Priorité 3";
      case AimOption.Fourth : 
        return "Priorité 4";
      case AimOption.Last : 
        return "En dernier";
      case AimOption.Disturbance : 
        return "Communications perturbées";
      case AimOption.Hidden : 
        return "Cartes faces cachées";
    }
  }
  
  Widget getIcon(BuildContext context) {
    return Text(this.displayValue);
  } 
}