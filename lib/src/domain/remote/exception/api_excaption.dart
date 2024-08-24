class ApiException implements Exception {
  final Map<String, dynamic> body;
  final String url;
  final int statusCode;

  ApiException(
    this.body, {
    required this.url,
    required this.statusCode,
  });

  @override
  String toString() {
    return 'ApiException: $body, url=$url';
  }
}
