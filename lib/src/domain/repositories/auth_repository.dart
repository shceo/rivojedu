import 'dart:convert';

import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/remote/exception/api_excaption.dart';
import 'package:edu/src/utils/api_constants/api_constants.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<String> login(String phoneNumber, String password) async {
    try {
      final  response = await apiClient.request(
        url: ApiConstants.signIn,
        method: "POST",
        body: {
          "phoneNumber": phoneNumber,
          "password": password,
        },
      );
      final data = jsonDecode(response);
      return data["token"];
    } on ApiException catch (e) {
      throw ErrorModel(message: e.body["friendlyMessage"]);
    }
  }
}
