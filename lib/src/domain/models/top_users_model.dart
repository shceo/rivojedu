class TopUsersModel {
  final String avatar;
  final String name;
  final String surName;
  final int percentage;

  TopUsersModel({
    required this.avatar,
    required this.name,
    required this.surName,
    required this.percentage,
  });

  factory TopUsersModel.fromJson(Map<String, dynamic> json) {
    return TopUsersModel(
      avatar: json['avatar'] as String? ?? "",
      name: json['name'] as String? ?? "",
      surName: json['surname'] as String? ?? "",
      percentage: json['percentage'] as int? ?? 0,
    );
  }

  factory TopUsersModel.init() {
    return TopUsersModel(
      avatar: "",
      name: "",
      surName: "",
      percentage: 0,
    );
  }
}
