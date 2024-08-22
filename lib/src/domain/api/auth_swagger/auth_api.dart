import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../entity/storage_repository.dart';

class UserAuth {
  static const String baseUrl = '164.90.187.178:8080';
  static const String path = '/api/v1/auth/sign-in';

  static Map<String, String> getHeaders() {
    return {
      "content-type": "application/json",
      "accept": "application/json",
    };
  }

  static Future<NetworkResponse> loginUser({
    required String phoneNumber,
    required String password,
  }) async {
    final Uri uri = Uri.http(baseUrl, path);
    try {
      final http.Response response = await http.post(
        uri,
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
        }),
        headers: getHeaders(),
      );

      debugPrint('${uri.path} :${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        String? id = data['id'];
        String? name = data['name'];
        String? surname = data['surname'];
        String? avatar = data['avatar'];
        String? phoneNumber = data['phoneNumber'];
        var birth = data['birth'];

        if (id != null) await StorageRepository.setString(key: 'user_id', value: id);
        if (name != null) await StorageRepository.setString(key: 'user_name', value: name);
        if (surname != null) await StorageRepository.setString(key: 'user_surname', value: surname);
        if (avatar != null) await StorageRepository.setString(key: 'user_avatar', value: avatar);
        if (phoneNumber != null) await StorageRepository.setString(key: 'user_phoneNumber', value: phoneNumber);
        if (birth != null) await StorageRepository.setString(key: 'user_birth', value: birth);

        return NetworkResponse(data: data);
      }

      return _handleHttpErrors(response);
    } on SocketException {
      return NetworkResponse(errorText: "No Internet Connection");
    } on FormatException {
      return NetworkResponse(errorText: "Invalid Response Format");
    } catch (err) {
      return NetworkResponse(errorText: err.toString());
    }
  }

  static Future<NetworkResponse> _handleHttpErrors(http.Response response) async {
    final String errorMessage;

    switch (response.statusCode) {
      case HttpStatus.notFound:
        errorMessage = 'User not found';
        break;
      case HttpStatus.unauthorized:
        errorMessage = 'Invalid credentials';
        break;
      default:
        errorMessage = 'Unhandled error: ${response.statusCode}';
    }

    return NetworkResponse(errorText: errorMessage);
  }
}

class NetworkResponse {
  final String errorText;
  final String errorCode;
  final dynamic data;

  NetworkResponse({
    this.errorText = "",
    this.errorCode = "",
    this.data,
  });
}
