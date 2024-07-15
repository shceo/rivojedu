class ConfirmCodeModel {
  bool success;
  String message;
  Data data;

  ConfirmCodeModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) =>
      ConfirmCodeModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Tokens tokens;
  User user;

  Data({
    required this.tokens,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tokens: Tokens.fromJson(json["tokens"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens.toJson(),
        "user": user.toJson(),
      };
}

class Tokens {
  Token refreshToken;
  Token accessToken;

  Tokens({
    required this.refreshToken,
    required this.accessToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refreshToken: Token.fromJson(json["refresh_token"]),
        accessToken: Token.fromJson(json["access_token"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh_token": refreshToken.toJson(),
        "access_token": accessToken.toJson(),
      };
}

class Token {
  String token;
  DateTime expiresAt;

  Token({
    required this.token,
    required this.expiresAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires_at": expiresAt.toIso8601String(),
      };
}

class User {
  String fullName;
  String phone;
  bool phoneConfirmed;
  DateTime createdAt;

  User({
    required this.fullName,
    required this.phone,
    required this.phoneConfirmed,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        phone: json["phone"],
        phoneConfirmed: json["phone_confirmed"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "phone_confirmed": phoneConfirmed,
        "created_at": createdAt.toIso8601String(),
      };
}
