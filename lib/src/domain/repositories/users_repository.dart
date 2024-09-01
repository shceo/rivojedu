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
      UserModel user = UserModel.fromJson(data);
      final coinAndScore = await apiClient.request(
        url: "${ApiConstants.getCoin}/${user.phoneNumber}",
        method: "GET",
      );
      final coinData = jsonDecode(coinAndScore);
      user = user.copyWith(
        coin: coinData["coin"],
        totalScore: coinData["totalScore"],
      );
      return user;
    } on ApiException catch (e) {
      throw ErrorModel(message: e.toString());
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      await apiClient.request(
        url: ApiConstants.updateUserData,
        method: "PUT",
        body: user.toJson(),
      );
    } on ApiException catch (e) {
      throw ErrorModel(message: e.body["friendlyMessage"]);
    }
  }
}
