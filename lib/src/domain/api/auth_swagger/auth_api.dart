import 'package:dio/dio.dart';

Future<void> signIn() async {
  final dio = Dio();
  const url = 'http://165.232.73.1:8080/api/v1/auth/sign-in';

  try {
    final response = await dio.post(url, data: {
      'username': 'your_username',
      'password': 'your_password',
    });

    if (response.statusCode == 200) {
      print('Успешный вход в систему: ${response.data}');
    } else if (response.statusCode == 404) {
      print('Пользователь не найден: ${response.data["message"]}');
    } else {
      print('Неизвестная ошибка: ${response.data}');
    }
  } catch (e) {
    print('Ошибка: $e');
  }
}


Future<void> signUp() async {
  final dio = Dio();
  const url = 'http://165.232.73.1:8080/api/v1/auth/sign-up';

  try {
    final response = await dio.post(url, data: {
      'name': String,
      'surname': String,
      'phoneNumber': String,
      'password': String,
    });

    if (response.statusCode == 200) {
      print('Успешная регистрация: ${response.data}');
    } else {
      print('Ошибка при регистрации: ${response.data}');
    }
  } catch (e) {
    print('Ошибка: $e');
  }
}
