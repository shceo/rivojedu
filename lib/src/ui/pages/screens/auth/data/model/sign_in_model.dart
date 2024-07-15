class SignInModel {
  bool success;
  String message;

  SignInModel({
    required this.success,
    required this.message,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
