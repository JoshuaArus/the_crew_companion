import 'package:flutter/material.dart';

class Mission {
  String id;
  String title;
  String description;
  int aimCount;
  int attempts;
  bool satelliteUsed;
  List<AimOption> aimOptions;
  
  Mission(this.id, this.title, this.description) {
    attempts = 0;
    satelliteUsed = false;
    aimOptions = List<AimOption>();
  }

  Mission(this.id, this.title, this.description, this.aimCount, this.attempts, this.satelliteUsed, this.aimOptions);
}

