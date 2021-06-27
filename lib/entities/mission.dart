import 'dart:convert';

import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

class Mission {
  late int id;
  late int aimCount;
  late int attempts;
  late bool satelliteUsed;
  late List<AimOption> aimOptions;

  Mission(this.id, this.aimCount, this.attempts, this.satelliteUsed,
      this.aimOptions);

  String get title {
    return AppLocalizations.instance!
        .translate('storyMission' + (this.id + 1).toString() + 'Title');
  }

  String get description {
    return AppLocalizations.instance!
        .translate('storyMission' + (this.id + 1).toString() + 'Description');
  }

  Mission get copy {
    return Mission.fromJson(jsonDecode(jsonEncode(this)));
  }

  Mission.fromData(
      {required this.id,
      required this.aimCount,
      required this.attempts,
      required this.satelliteUsed,
      required this.aimOptions});

  factory Mission.fromJson(Map<String, dynamic> json) {
    List<dynamic> dyn = (jsonDecode(json["aimOptions"]) as List<dynamic>);
    List<AimOption> aimOptions = dyn
        .map(
          (ao) => AimOptionFactory.fromString(
            ao.toString(),
          ),
        )
        .toList();
    return Mission.fromData(
      id: json["id"] as int,
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
        "aimOptions": jsonEncode(
          aimOptions
              .map(
                (ao) => ao.toString(),
              )
              .toList(),
        ),
      };
}
