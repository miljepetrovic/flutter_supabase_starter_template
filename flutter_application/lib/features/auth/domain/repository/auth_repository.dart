import '../entity/auth_user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<void> loginWithEmail(String email);
  Future<void> logout();
  Stream<AuthState> getCurrentAuthState();
  AuthUserEntity? getLoggedInUser();
}
