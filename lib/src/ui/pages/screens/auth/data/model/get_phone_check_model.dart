import 'dart:convert';

class GetPhoneCheckModel {
  final bool success;
  final Data data;

  GetPhoneCheckModel({
    required this.success,
    required this.data,
  });

  factory GetPhoneCheckModel.fromRawJson(String str) =>
      GetPhoneCheckModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetPhoneCheckModel.fromJson(Map<String, dynamic> json) =>
      GetPhoneCheckModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  final bool phoneExists;

  Data({
    required this.phoneExists,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        phoneExists: json["phoneExists"],
      );

  Map<String, dynamic> toJson() => {
        "phoneExists": phoneExists,
      };
}
