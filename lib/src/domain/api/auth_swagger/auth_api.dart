import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../entity/storage_repository.dart';

class UserAuth {
  // static final Dio _dio = Dio(BaseOptions(
  //   baseUrl: 'http://143.110.188.247:8080/api/v1/auth',
  //   headers: {
  //     'Content-Type': 'application/json',
  //   },
  // ));

  // static Future<bool> signIn(String phoneNumber, String password) async {
  //   try {
  //     final response = await _dio.post(
  //       '/sign-in',
  //       data: {
  //         'phoneNumber': phoneNumber,
  //         'password': password,
  //       },
  //     );
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Fluttertoast.showToast(msg: 'Successful login');
  //       return true;
  //     } else if (response.statusCode == 404) {
  //       Fluttertoast.showToast(
  //           msg: 'User not found: ${response.data["message"]}');
  //       return false;
  //     } else if (response.statusCode == 401) {
  //       Fluttertoast.showToast(
  //           msg: 'Unauthorized: ${response.data["message"]}');
  //       return false;
  //     } else {
  //       Fluttertoast.showToast(msg: 'Unknown error: ${response.data}');
  //       return false;
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Unknown error: $e');
  //     // if (e is DioException) {
  //     //   if (e.response != null) {
  //     //     if (e.response!.statusCode == 404) {
  //     //       Fluttertoast.showToast(msg: 'User not found: ${e.response!.data["message"]}');
  //     //     } else if (e.response!.statusCode == 401) {
  //     //       Fluttertoast.showToast(msg: 'Unauthorized: ${e.response!.data["message"]}');
  //     //     } else {
  //     //       Fluttertoast.showToast(msg: 'Unknown error: ${e.response!.data}');
  //     //     }
  //     //   } else {
  //     //     Fluttertoast.showToast(msg: 'Network error: ${e.message}');
  //     //   }
  //     // } else {
  //     //   Fluttertoast.showToast(msg: 'Unknown error: $e');
  //     // }
  //     return false;
  //   }
  // }

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
    Uri uri = Uri.http(
      "143.110.188.247:8080",
      "/api/v1/auth/sign-in",
    );
    try {
      http.Response response = await http.post(
        uri,
        body: jsonEncode(
          {
            'phoneNumber': phoneNumber,
            'password': password,
          },
        ),
        headers: getHeaders(),
      );
      debugPrint('${uri.path} :${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok) {
        final data = jsonDecode(response.body);

        if (data != null) {
          final userData = data;
          String? token = userData['token'];
          debugPrint("TOKEN - $token");
          if (token != null) {
            await StorageRepository.setString(
                key: 'access_token', value: token);
            await StorageRepository.setString(
              key: 'user_password',
              value: password,
            );
            return NetworkResponse(data: userData);
          } else {
            return NetworkResponse(
              errorText: "Token yo'q",
            );
          }
        } else {
          return NetworkResponse(
            errorText: 'Ma\'lumotlar mavjud emas',
          );
        }
      }
      return handleHttpErrors(response);
    } on SocketException {
      return NetworkResponse(errorText: "Internet Error!");
    } on FormatException {
      return NetworkResponse(errorText: "Format Error!");
    } catch (err) {
      return NetworkResponse(errorText: err.toString());
    }
  }

  static Future<NetworkResponse> handleHttpErrors(
      http.Response response) async {
    return NetworkResponse(
      errorText: "Unhandled error: ${response.statusCode}",
    );
  }
}

class NetworkResponse {
  String errorText;
  String errorCode;
  dynamic data;

  NetworkResponse({
    this.errorText = "",
    this.errorCode = "",
    this.data,
  });
}
