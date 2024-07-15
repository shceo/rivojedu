
import '../../domain/entity/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  const SignUpModel(
      {required super.fullName,
      required super.phone,
      required super.birthDate});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        fullName: json["full_name"],
        phone: json["phone"],
        birthDate: json["birth_date"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "birth_date": birthDate,
      };
}
