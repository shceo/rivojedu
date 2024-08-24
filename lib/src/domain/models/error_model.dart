class ErrorModel {
  final String message;

  ErrorModel({
    required this.message,
  });

  @override
  String toString() {
    return message;
  }
}
