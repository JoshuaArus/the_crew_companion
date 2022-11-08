//ignore_for_file: ARGUMENT_TYPE_NOT_ASSIGNABLE
import 'dart:convert';

class AchievedMission {
  int id;
  int attempts;
  bool satelliteUsed;
  String? comment;
  int? durationInSeconds;

  AchievedMission({
    required this.id,
    required this.attempts,
    required this.satelliteUsed,
    this.comment,
    this.durationInSeconds,
  });

  AchievedMission copyWith({
    int? id,
    int? attempts,
    bool? satelliteUsed,
    String? comment,
    int? durationInSeconds,
  }) {
    return AchievedMission(
      id: id ?? this.id,
      attempts: attempts ?? this.attempts,
      satelliteUsed: satelliteUsed ?? this.satelliteUsed,
      comment: comment ?? this.comment,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'attempts': attempts,
      'satelliteUsed': satelliteUsed,
      'comment': comment,
      'durationInSeconds': durationInSeconds,
    };
  }

  factory AchievedMission.fromMap(Map<String, dynamic> map) {
    return AchievedMission(
      id: map['id'],
      attempts: map['attempts'],
      satelliteUsed: map['satelliteUsed'],
      comment: map['comment'],
      durationInSeconds: map['durationInSeconds'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievedMission.fromJson(String source) =>
      AchievedMission.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AchievedMission(id: $id, attempts: $attempts, satelliteUsed: $satelliteUsed, comment: $comment, durationInSeconds: $durationInSeconds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AchievedMission &&
        other.id == id &&
        other.attempts == attempts &&
        other.satelliteUsed == satelliteUsed &&
        other.comment == comment &&
        other.durationInSeconds == durationInSeconds;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        attempts.hashCode ^
        satelliteUsed.hashCode ^
        comment.hashCode ^
        durationInSeconds.hashCode;
  }
}
