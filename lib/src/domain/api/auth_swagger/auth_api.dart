import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuth {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://134.122.28.243:8080/api/v1/auth/sign-in',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  ));

  static Future<void> signIn(String phoneNumber, String password) async {
    try {
      final response = await _dio.post(
        '',
        data: {
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Successful login');
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(
            msg: 'User not found: ${response.data["message"]}');
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: 'Unauthorized: ${response.data["message"]}');
      } else {
        Fluttertoast.showToast(msg: 'Unknown error: ${response.data}');
      }
    } catch (e) {
      if (e is DioError) {
        Fluttertoast.showToast(msg: 'Network error: ${e.message}');
      } else {
        Fluttertoast.showToast(msg: 'Unknown error: $e');
      }
    }
  }
}
