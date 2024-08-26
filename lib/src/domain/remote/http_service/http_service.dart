import 'dart:convert';

import 'package:edu/src/domain/entity/storage_repository.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../impl/api_client_impl.dart';
import '../exception/api_excaption.dart';

class HttpService implements ApiClientImpl {
  final client = http.Client();
  final logger = Logger();

  Future<Map<String, String>> _getHeader({Map<String, String>? header}) async {
    final requestHeader = header ?? {};

    requestHeader.addAll({'content-type': 'application/json'});

    final String accessToken = StorageRepository.getString(key: "access_token");

    if (accessToken.isNotEmpty) {
      requestHeader.addAll({"Authorization": "Bearer $accessToken"});
    }

    return requestHeader;
  }

  @override
  Future<String> request({
    required String url,
    required String method,
    var body,
    Map<String, String>? header,
    bool isResponseBody = false,
  }) async {
    final requestHeader = await _getHeader(header: header);

    http.Response response;
    try {
      switch (method) {
        case 'GET':
          response = await _getRequest(
            url: url,
            header: requestHeader,
          );
          break;
        case 'POST':
          response = await _postRequest(
            url: url,
            body: body ?? {},
            header: requestHeader,
          );
          break;
        case 'PUT':
          response = await _putRequest(
            url: url,
            body: body ?? {},
            header: requestHeader,
          );
          break;
        case 'DELETE':
          response = await _deleteRequest(
            url: url,
            body: body ?? {},
            header: requestHeader,
          );
          break;
        case 'PATCH':
          response = await _patchRequest(
            url: url,
            body: body ?? {},
            header: requestHeader,
          );
          break;

        default:
          throw ApiException(
            {'message': 'No such method'},
            statusCode: 0,
            url: url,
          );
      }

      logger.i(
        '${response.request} ${response.statusCode}\n$requestHeader\n$body\n${response.body}',
      );

      if (response.statusCode >= 400 && response.statusCode < 500) {
        throw ApiException(
          jsonDecode(response.body),
          statusCode: response.statusCode,
          url: url,
        );
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      }

      logger.e(response.statusCode);
      throw ApiException(
        jsonDecode(response.body),
        statusCode: response.statusCode,
        url: url,
      );
    } catch (e) {
      if (isResponseBody) {
        return "error";
      }
      logger.e(
        '$method $url\n$requestHeader\n$body\n$e',
      );
      rethrow;
    }
  }

  Future<http.Response> _getRequest({
    required String url,
    required Map<String, String>? header,
  }) async {
    return await client.get(
      Uri.parse(url),
      headers: header,
    );
  }

  Future<http.Response> _postRequest({
    required String url,
    required body,
    required Map<String, String>? header,
  }) async {
    return await client.post(
      Uri.parse(url),
      headers: header,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> _deleteRequest({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String>? header,
  }) async {
    return await client.delete(
      Uri.parse(url),
      headers: header,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> _patchRequest({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String>? header,
  }) async {
    return await client.patch(
      Uri.parse(url),
      headers: header,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> _putRequest({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String>? header,
  }) async {
    return await client.put(
      Uri.parse(url),
      headers: header,
      body: jsonEncode(body),
    );
  }
}
