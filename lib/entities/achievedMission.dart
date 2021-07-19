//ignore_for_file: ARGUMENT_TYPE_NOT_ASSIGNABLE
import 'dart:convert';

class AchievedMission {
  int id;
  int attempts;
  bool satelliteUsed;
  AchievedMission({
    required this.id,
    required this.attempts,
    required this.satelliteUsed,
  });

  AchievedMission copyWith({
    int? id,
    int? attempts,
    bool? satelliteUsed,
  }) {
    return AchievedMission(
      id: id ?? this.id,
      attempts: attempts ?? this.attempts,
      satelliteUsed: satelliteUsed ?? this.satelliteUsed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'attempts': attempts,
      'satelliteUsed': satelliteUsed,
    };
  }

  factory AchievedMission.fromMap(Map<String, dynamic> map) {
    return AchievedMission(
      id: map['id'],
      attempts: map['attempts'],
      satelliteUsed: map['satelliteUsed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievedMission.fromJson(String source) =>
      AchievedMission.fromMap(json.decode(source));

  @override
  String toString() =>
      'AchievedMission(id: $id, attempts: $attempts, satelliteUsed: $satelliteUsed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AchievedMission &&
        other.id == id &&
        other.attempts == attempts &&
        other.satelliteUsed == satelliteUsed;
  }

  @override
  int get hashCode => id.hashCode ^ attempts.hashCode ^ satelliteUsed.hashCode;
}
