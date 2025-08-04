class AppConfig {
  /// Base URL for the backend server. The value can be overridden at build
  /// time using the `SERVER_URL` compile-time environment variable:
  /// `flutter run --dart-define=SERVER_URL=http://<your-host>:<port>`.
  static const String serverUrl = String.fromEnvironment(
    'SERVER_URL',
    defaultValue: 'http://10.0.2.2:8080',
  );

  /// Endpoint used to request the current video URL.
  static String get currentVideoEndpoint => '$serverUrl/current-video';
}
