import 'dart:convert';

import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/user_model.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/remote/exception/api_excaption.dart';
import 'package:edu/src/utils/api_constants/api_constants.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<UserModel> getUserData() async {
    try {
      final response =
          await apiClient.request(url: ApiConstants.getUserData, method: "GET");
      final data = jsonDecode(response);
      return UserModel.fromJson(data);
    } on ApiException catch (e) {
      throw ErrorModel(message: e.toString());
    }
  }
}
