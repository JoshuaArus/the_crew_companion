import 'aimOption.dart';

class Mission {
  String id;
  String title;
  String description;
  int aimCount;
  int attempts;
  bool satelliteUsed;
  List<AimOption> aimOptions;
  
  Mission(this.id, this.title, this.description, this.aimCount, this.attempts, this.satelliteUsed, this.aimOptions);
}

