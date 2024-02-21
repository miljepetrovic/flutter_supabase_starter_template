part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AuthInitialCheckRequested extends AuthEvent {
  const AuthInitialCheckRequested();
}

class AuthOnCurrentUserChanged extends AuthEvent {
  const AuthOnCurrentUserChanged(
    this.user,
  );

  final AuthUserEntity? user;
}

class AuthLogoutButtonPressed extends AuthEvent {
  const AuthLogoutButtonPressed();
}
