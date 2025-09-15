/// A simple logger utility for console applications in Dart.
class Logger {
  /// Logs an informational message in blue color.
  static void info(String message) {
    print('\x1B[34mℹ️  $message\x1B[0m'); // Blue
  }

  /// Logs a success message in green color.
  static void success(String message) {
    print('\x1B[32m✅ $message\x1B[0m'); // Green
  }

  /// Logs an error message in red color.
  static void error(String message) {
    print('\x1B[31m❌ $message\x1B[0m'); // Red
  }
}
