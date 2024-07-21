// import 'package:dio/dio.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
//
// class UserAuth {
//   static final Dio _dio = Dio();
//   static const String _url = 'http://165.232.73.1:8080/api/v1/auth/sign-in';
//
//   static Future<void> signIn(String phoneNumber, String password) async {
//     try {
//       final response = await _dio.post(_url, data: {
//         'phoneNumber': phoneNumber,
//         'password': password,
//       });
//
//       if (response.statusCode == 200) {
//         Fluttertoast.showToast(msg: 'Успешный вход в систему');
//       } else if (response.statusCode == 404) {
//         Fluttertoast.showToast(msg: 'Пользователь не найден: ${response.data["message"]}');
//       } else {
//         Fluttertoast.showToast(msg: 'Неизвестная ошибка: ${response.data}');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: 'Ошибка сети');
//     }
//   }
//
// }

import 'package:dio/dio.dart';
import 'package:edu/src/domain/api/data/auth_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserAuth {
  static final Dio _dio = Dio();
  static const String _baseUrl = 'http://165.232.73.1:8080/api/v1/auth';

  static Future<void> signIn(String phoneNumber, String password) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/sign-in',
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
      } else {
        Fluttertoast.showToast(msg: 'Unknown error: ${response.data}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Unknown error: $e');
    }
  }

  // static Future<void> signUp(UserModel userModel) async {
  //   try {
  //     final response = await _dio.post(
  //       '$_baseUrl/sign-in',
  //       data: {
  //         "name": userModel.name,
  //         "surname": userModel.surname,
  //         "phoneNumber": userModel.phoneNumber,
  //         "password": userModel.phoneNumber
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       Fluttertoast.showToast(msg: 'Successful login');
  //     } else if (response.statusCode == 404) {
  //       Fluttertoast.showToast(
  //           msg: 'User not found: ${response.data["message"]}');
  //     } else {
  //       Fluttertoast.showToast(msg: 'Unknown error: ${response.data}');
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Unknown error: $e');
  //   }
  // }
}
