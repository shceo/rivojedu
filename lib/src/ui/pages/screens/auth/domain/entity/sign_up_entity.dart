// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String fullName;
  final String phone;
  final String birthDate;

  const SignUpEntity({
    required this.fullName,
    required this.phone,
    required this.birthDate,
  });

  @override
  List<Object?> get props => [fullName, phone, birthDate];
}
