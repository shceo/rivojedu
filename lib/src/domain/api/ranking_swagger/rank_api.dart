import 'package:dio/dio.dart';

class BestStudents {
  final Dio _dio = Dio();

  Future<List> fetchBestStudents() async {
    try {
      Response response = await _dio.get('http://143.110.188.247:8080/api/v1/progress/get-ranking-page');
      if (response.statusCode == 200) {
        return response.data['bestStudents'];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
