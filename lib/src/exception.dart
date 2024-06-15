class ConfigException implements Exception {
  final String message;

  ConfigException(this.message);

  @override
  String toString() => 'ConfigException: $message';
}

class CopierException implements Exception {
  final String message;

  CopierException(this.message);

  @override
  String toString() => 'CopierException: $message';
}

class OptionException implements Exception {
  final String message;

  OptionException(this.message);

  @override
  String toString() => 'OptionException: $message';
}
