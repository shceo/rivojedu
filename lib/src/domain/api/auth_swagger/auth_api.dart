import 'package:dio/dio.dart';


Future<void> signIn() async {
  final dio = Dio();
  const url = 'http://165.232.73.1:8080/api/v1/auth/sign-in';

  try {
    final response = await dio.post(url, data: {
      'phoneNumber': 'userPhone',
      'password': 'userPassword',
    
    });
 
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print('Успешный вход в систему: ${response.data}');
    } else if (response.statusCode == 404) {
      // ignore: avoid_print
      print('Пользователь не найден: ${response.data["message"]}');
    } else {
      print('Неизвестная ошибка: ${response.data}');
    }
  } catch (e) {
    // ignore: avoid_print
   return;
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
