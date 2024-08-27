class UserModel {
  final String id;
  final String name;
  final String surname;
  final String avatar;
  final String phoneNumber;
  final String birthDate;
  final String subjectId;
  final String currentLessonId;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.avatar,
    required this.phoneNumber,
    required this.birthDate,
    required this.subjectId,
    required this.currentLessonId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id:  json["id"] as String? ?? "",
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      birthDate: json['birth'] as String? ?? "",
      subjectId: json['subjectId'] as String? ?? "",
      currentLessonId: json['currentLessonId'] as String? ?? "",
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
    );
  }
}
