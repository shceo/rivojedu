import 'package:equatable/equatable.dart';

class SignUpResponseModel extends Equatable {
  final bool success;
  final String message;

  const SignUpResponseModel({
    required this.success,
    required this.message,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };

  @override
  List<Object?> get props => [success, message];
}
