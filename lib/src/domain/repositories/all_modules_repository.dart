import 'dart:convert';

import 'package:edu/src/domain/models/all_modules_model.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/remote/exception/api_excaption.dart';
import 'package:edu/src/utils/api_constants/api_constants.dart';

class AllModulesRepository {
  final ApiClient apiClient;

  AllModulesRepository({required this.apiClient});

  Future<List<AllModulesModel>> getAllModules() async {
    try {
      final response = await apiClient.request(
        url: ApiConstants.allModules,
        method: "GET",
      );
      final List<dynamic> data = jsonDecode(response);

      return data
          .map((dataJson) => AllModulesModel.fromJson(dataJson as Map<String, dynamic>))
          .toList();
    } on ApiException catch (e) {
      throw ErrorModel(message: e.toString());
    }
  }

}
