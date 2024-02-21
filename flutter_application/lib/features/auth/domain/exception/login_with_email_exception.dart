class LoginWithEmailException implements Exception {
  const LoginWithEmailException([
    this.message = 'An unknown exception occurred.',
  ]);

  final String message;
}
