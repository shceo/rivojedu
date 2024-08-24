import 'http_service/http_service.dart';
import 'impl/api_client_impl.dart';

class ApiClient implements ApiClientImpl {
  final apiClient = HttpService();

  @override
  Future<String> request({
    required String url,
    required String method,
    dynamic body,
    Map<String, String>? header,
    bool isResponseBody = false,
  }) async {
    return await apiClient.request(
      url: url,
      method: method,
      body: body,
      header: header,
      isResponseBody: isResponseBody,
    );
  }
}
