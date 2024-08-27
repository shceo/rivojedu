import 'dart:convert';

import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/top_users_model.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/remote/exception/api_excaption.dart';
import 'package:edu/src/utils/api_constants/api_constants.dart';

class TopUsersRepository {
  final ApiClient apiClient;

  TopUsersRepository({required this.apiClient});

  Future<List<TopUsersModel>> getTopUsers() async {
    try {
      final response =
      await apiClient.request(url: ApiConstants.getRanking, method: "GET");
      final Map<String, dynamic> data = jsonDecode(response);
      final List<dynamic> bestStudents = data['bestStudents'];
      return bestStudents
          .map((dataJson) =>
          TopUsersModel.fromJson(dataJson as Map<String, dynamic>))
          .toList();
    } on ApiException catch (e) {
      throw ErrorModel(message: e.body.toString());
    }
  }

}
