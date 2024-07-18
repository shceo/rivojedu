import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuth {
  static final Dio _dio = Dio();
  static const String _url = 'http://165.232.73.1:8080/api/v1/auth/sign-in';

  static Future<void> signIn(String phoneNumber, String password) async {
    try {
      final response = await _dio.post(_url, data: {
        'phoneNumber': phoneNumber,
        'password': password,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Успешный вход в систему');
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(
            msg: 'Пользователь не найден: ${response.data["message"]}');
      } else {
        Fluttertoast.showToast(msg: 'Неизвестная ошибка: ${response.data}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Ошибка сети');
    }
  }
}
