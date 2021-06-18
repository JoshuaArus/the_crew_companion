import 'dart:convert';

import 'package:collection/collection.dart';

import 'aimOption.dart';

class Mission {
  int id;
  String title;
  String description;
  int aimCount;
  int attempts;
  bool satelliteUsed;
  List<AimOption> aimOptions;
  
  Mission(
    this.id,
    this.title,
    this.description,
    this.aimCount,
    this.attempts,
    this.satelliteUsed,
    this.aimOptions,
  );

  Mission get copy {
    return Mission.fromJson(jsonDecode(jsonEncode(this)));
  }

  Mission copyWith({
    int? id,
    String? title,
    String? description,
    int? aimCount,
    int? attempts,
    bool? satelliteUsed,
    List<AimOption>? aimOptions,
  }) {
    return Mission(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      aimCount ?? this.aimCount,
      attempts ?? this.attempts,
      satelliteUsed ?? this.satelliteUsed,
      aimOptions ?? this.aimOptions,
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
      map['id'],
      map['title'],
      map['description'],
      map['aimCount'],
      map['attempts'],
      map['satelliteUsed'],
      List<AimOption>.from(map['aimOptions']?.map((x) => AimOptionFactory.fromString(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) => Mission.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mission(id: $id, title: $title, description: $description, aimCount: $aimCount, attempts: $attempts, satelliteUsed: $satelliteUsed, aimOptions: $aimOptions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
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

