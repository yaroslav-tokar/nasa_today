class DataNotFoundException implements Exception {}

class DataParsingException implements Exception {
  DataParsingException(this.message);

  final String message;
}
