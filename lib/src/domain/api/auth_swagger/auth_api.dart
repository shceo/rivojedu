import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuth {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://143.110.188.247:8080/api/v1/auth',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  static Future<bool> signIn(String phoneNumber, String password) async {
    try {
      final response = await _dio.post(
        '/sign-in',
        data: {
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Successful login');
        return true;
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: 'User not found: ${response.data["message"]}');
        return false;
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: 'Unauthorized: ${response.data["message"]}');
        return false;
      } else {
        Fluttertoast.showToast(msg: 'Unknown error: ${response.data}');
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          if (e.response!.statusCode == 404) {
            Fluttertoast.showToast(msg: 'User not found: ${e.response!.data["message"]}');
          } else if (e.response!.statusCode == 401) {
            Fluttertoast.showToast(msg: 'Unauthorized: ${e.response!.data["message"]}');
          } else {
            Fluttertoast.showToast(msg: 'Unknown error: ${e.response!.data}');
          }
        } else {
          Fluttertoast.showToast(msg: 'Network error: ${e.message}');
        }
      } else {
        Fluttertoast.showToast(msg: 'Unknown error: $e');
      }
      return false;
    }
  }
}
