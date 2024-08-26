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
      final url = "${ApiConstants.allLessons}?moduleId=$id";
      final response = await apiClient.request(url: url, method: "GET");
      final data = jsonDecode(response);

      if (data is List) {
        return data
            .map((dataJson) =>
            AllLessonsModel.fromJson(dataJson as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiException({'message': 'Invalid data format'}, statusCode: 0, url: url);
      }
    } on ApiException catch (e) {
      throw ErrorModel(message: e.body["message"]);
    }
  }
}
