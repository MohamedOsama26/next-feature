class Logger {
  static void info(String message) {
    print('\x1B[34mℹ️  $message\x1B[0m'); // Blue
  }

  static void success(String message) {
    print('\x1B[32m✅ $message\x1B[0m'); // Green
  }

  static void error(String message) {
    print('\x1B[31m❌ $message\x1B[0m'); // Red
  }
}