//File Created on 14-06-2024 12:13PM
class TFirebaseException implements Exception {
  final String code;
  TFirebaseException(this.code);

  String get message {
    switch (code) {
      default:
        return 'An error occurred with Firebase.';
    }
  }
}