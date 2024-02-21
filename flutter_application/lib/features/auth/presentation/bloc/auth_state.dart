part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthUserAuthenticated extends AuthState {
  const AuthUserAuthenticated(
    this.user,
  );

  final AuthUserEntity user;

  @override
  List<Object> get props => [
        user,
      ];
}

class AuthUserUnauthenticated extends AuthState {
  const AuthUserUnauthenticated();
}
