class ResendCodeModel {
  bool success;
  String message;

  ResendCodeModel({
    required this.success,
    required this.message,
  });

  factory ResendCodeModel.fromJson(Map<String, dynamic> json) =>
      ResendCodeModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
