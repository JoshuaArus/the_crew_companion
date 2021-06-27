class AchievedMission {
  int id;
  int attempts;
  bool satelliteUsed;

  AchievedMission(this.id, this.attempts, this.satelliteUsed);

  AchievedMission.fromData({
    required this.id,
    required this.attempts,
    required this.satelliteUsed,
  });

  factory AchievedMission.fromJson(Map<String, dynamic> json) {
    return AchievedMission.fromData(
      id: json["id"] as int,
      attempts: json["attempts"] as int,
      satelliteUsed: json["satelliteUsed"] as bool,
    );
  }

  Map toJson() => {
        "id": id,
        "attempts": attempts,
        "satelliteUsed": satelliteUsed,
      };
}
