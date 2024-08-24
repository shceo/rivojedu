class UserModel {
  final String name;
  final String surname;
  final String avatar;
  final String phoneNumber;
  final String birthDate;

  UserModel({
    required this.name,
    required this.surname,
    required this.avatar,
    required this.phoneNumber,
    required this.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String? ?? "",
      surname: json['surname'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      phoneNumber: json['phone_number'] as String? ?? "",
      birthDate: json['birth_date'] as String? ?? "",
    );
  }

  factory UserModel.init() {
    return UserModel(
      name: "",
      surname: "",
      avatar: "",
      phoneNumber: "",
      birthDate: "",
    );
  }
}
