class UserValidator {
  void validateEmail(String email) {
    if (!email.contains('@')) {
      throw ArgumentError("Email must contain '@'.");
    }
  }
}
