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
  Last
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
        }
  }
  
  Widget getIcon(BuildContext context) {
    return Text(this.displayValue);
  }
}