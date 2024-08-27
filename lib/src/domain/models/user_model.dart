class UserModel {
  final String id;
  final String name;
  final String surname;
  final String avatar;
  final String phoneNumber;
  final String birthDate;
  final String subjectId;
  final String currentLessonId;
  final int coin;
  final int totalScore;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.avatar,
    required this.phoneNumber,
    required this.birthDate,
    required this.subjectId,
    required this.currentLessonId,
    required this.coin,
    required this.totalScore,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as String? ?? "",
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      birthDate: json['birth'] as String? ?? "",
      subjectId: json['subjectId'] as String? ?? "",
      currentLessonId: json['currentLessonId'] as String? ?? "",
      coin: json['coin'] as int? ?? 0,
      totalScore: json['totalScore'] as int? ?? 0,
    );
  }

  factory UserModel.init() {
    return UserModel(
      id: "",
      name: "",
      surname: "",
      avatar: "",
      phoneNumber: "",
      birthDate: "",
      subjectId: "",
      currentLessonId: "",
      coin: 0,
      totalScore: 0,
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? surname,
    String? avatar,
    String? phoneNumber,
    String? birthDate,
    String? subjectId,
    String? currentLessonId,
    int? coin,
    int? totalScore,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        avatar: avatar ?? this.avatar,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        subjectId: subjectId ?? this.subjectId,
        currentLessonId: currentLessonId ?? this.currentLessonId,
        coin: coin ?? this.coin,
        totalScore: totalScore ?? this.totalScore,
      );
}
