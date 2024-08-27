import 'dart:convert';

import 'package:edu/src/domain/models/all_lessons_model.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/remote/exception/api_excaption.dart';
import 'package:edu/src/utils/api_constants/api_constants.dart';

class AllLessonsRepository {
  final ApiClient apiClient;

  AllLessonsRepository({required this.apiClient});

  Future<List<AllLessonsModel>> getAllLessons({required String id}) async {
    try {
      final response = await apiClient.request(
          url: ApiConstants.allLessons, method: "GET", header: {"moduleId": id});
      final data = jsonDecode(response);

      return data
          .map((dataJson) =>
              AllLessonsModel.fromJson(dataJson as Map<String, dynamic>))
          .toList();
    } on ApiException catch (e) {
      throw ErrorModel(message: e.toString());
    }
  }
}
