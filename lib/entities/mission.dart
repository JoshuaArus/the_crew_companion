import 'dart:convert';

import 'aimOption.dart';

class Mission {
  int id;
  String title;
  String description;
  int aimCount;
  int attempts;
  bool satelliteUsed;
  List<AimOption> aimOptions;
  
  Mission(this.id, this.title, this.description, this.aimCount, this.attempts, this.satelliteUsed, this.aimOptions);

  Mission.fromData({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.aimCount, 
    required this.attempts, 
    required this.satelliteUsed, 
    required this.aimOptions
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    List<dynamic> dyn = (jsonDecode(json["aimOptions"]) as List<dynamic>);
    List<AimOption> aimOptions = dyn.map((ao) => AimOptionFactory.fromString(ao.toString())).toList();
    return Mission.fromData(
      id: json["id"] as int,
      title: json["title"] as String,
      description: json["description"] as String,
      aimCount: json["aimCount"] as int,
      attempts: json["attempts"] as int,
      satelliteUsed: json["satelliteUsed"] as bool,
      aimOptions: aimOptions,
    );
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "aimCount": aimCount,
    "attempts": attempts,
    "satelliteUsed": satelliteUsed,
    "aimOptions": jsonEncode(aimOptions.map((ao) => ao.toString()).toList())
  };
}

