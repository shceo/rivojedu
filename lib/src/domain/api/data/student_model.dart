class StudentModel {
  final String name;
  final String id;
  final String surname;
  final String dateOfBirth;
  final String password;

  StudentModel({
    required this.id,
    required this.password,
    required this.name,
    required this.dateOfBirth,
    required this.surname,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      surname: json['surname'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'surname': surname,
    };
  }

  StudentModel copyWith({
    String? id,
    String? password,
    String? name,
    String? dateOfBirth,
    String? surname,
  }) {
    return StudentModel(
      id: id ?? this.id,
      password: password ?? this.password,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      surname: surname ?? this.surname,
    );
  }
}
