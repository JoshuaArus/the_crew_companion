//ignore_for_file: ARGUMENT_TYPE_NOT_ASSIGNABLE
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

class Mission {
  int id;
  int aimCount;
  int attempts;
  bool satelliteUsed;
  List<AimOption> aimOptions;

  Mission({
    required this.id,
    required this.aimCount,
    required this.attempts,
    required this.satelliteUsed,
    required this.aimOptions,
  });

  String get title {
    return AppLocalizations.translate('storyMission${id + 1}Title');
  }

  String get description {
    return AppLocalizations.translate('storyMission${id + 1}Description');
  }

  Mission copyWith({
    int? id,
    int? aimCount,
    int? attempts,
    bool? satelliteUsed,
    List<AimOption>? aimOptions,
  }) {
    return Mission(
      id: id ?? this.id,
      aimCount: aimCount ?? this.aimCount,
      attempts: attempts ?? this.attempts,
      satelliteUsed: satelliteUsed ?? this.satelliteUsed,
      aimOptions: aimOptions ?? this.aimOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'aimCount': aimCount,
      'attempts': attempts,
      'satelliteUsed': satelliteUsed,
      'aimOptions': aimOptions.map((x) => x.toString()).toList(),
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      id: map['id'],
      aimCount: map['aimCount'],
      attempts: map['attempts'],
      satelliteUsed: map['satelliteUsed'],
      aimOptions: List<AimOption>.from(
          map['aimOptions']?.map((x) => AimOptionFactory.fromString(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mission(id: $id, title: $title, description: $description, aimCount: $aimCount, attempts: $attempts, satelliteUsed: $satelliteUsed, aimOptions: $aimOptions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mission &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.aimCount == aimCount &&
        other.attempts == attempts &&
        other.satelliteUsed == satelliteUsed &&
        listEquals(other.aimOptions, aimOptions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        aimCount.hashCode ^
        attempts.hashCode ^
        satelliteUsed.hashCode ^
        aimOptions.hashCode;
  }
}
