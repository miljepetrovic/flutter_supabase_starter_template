import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application/core/use_cases/no_params.dart';
import 'package:flutter_application/features/auth/data/mapper/auth_mapper.dart';
import 'package:flutter_application/features/auth/domain/entity/auth_user_entity.dart';
import 'package:flutter_application/features/auth/domain/use_case/get_current_auth_state_use_case.dart';
import 'package:flutter_application/features/auth/domain/use_case/logout_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase_auth;

import '../../domain/use_case/get_logged_in_user_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._getLoggedInUserUseCase,
    this._getAuthStateUseCase,
    this._logoutUseCase,
  ) : super(
          const AuthInitial(),
        ) {
    on<AuthInitialCheckRequested>(_onInitialAuthChecked);
    on<AuthOnCurrentUserChanged>(_onCurrentUserChanged);
    on<AuthLogoutButtonPressed>(_onLogoutButtonPressed);

    _startUserSubscription();
  }

  final GetLoggedInUserUseCase _getLoggedInUserUseCase;
  final GetCurrentAuthStateUseCase _getAuthStateUseCase;
  final LogoutUseCase _logoutUseCase;

  late final StreamSubscription<supabase_auth.AuthState>? _authSubscription;

  void _startUserSubscription() {
    _authSubscription = _getAuthStateUseCase.execute(NoParams()).listen(
          (supabaseAuthState) => add(AuthOnCurrentUserChanged(
            supabaseAuthState.session?.user.toUserEntity(),
          )),
        );
  }

  Future<void> _onInitialAuthChecked(
    AuthInitialCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    AuthUserEntity? signedInUser = _getLoggedInUserUseCase.execute(NoParams());
    signedInUser != null
        ? emit(AuthUserAuthenticated(signedInUser))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onCurrentUserChanged(
    AuthOnCurrentUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    event.user != null
        ? emit(AuthUserAuthenticated(event.user!))
        : emit(const AuthUserUnauthenticated());
  }

  Future<void> _onLogoutButtonPressed(
    AuthLogoutButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUseCase.execute(NoParams());
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
