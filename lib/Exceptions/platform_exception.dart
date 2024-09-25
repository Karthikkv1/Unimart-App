//File Created on 14-06-2024 12:16PM
class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);

  String get message {
    switch (code) {
      default:
        return 'A platform exception occurred.';
    }
  }
}