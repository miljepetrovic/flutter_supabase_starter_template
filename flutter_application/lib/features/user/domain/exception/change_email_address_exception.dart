class ChangeEmailAddressException implements Exception {
  const ChangeEmailAddressException({
    this.message = 'An unknown exception occurred.',
  });

  final String message;
}
