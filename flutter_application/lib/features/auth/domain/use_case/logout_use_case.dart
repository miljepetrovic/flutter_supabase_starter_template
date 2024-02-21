import 'package:injectable/injectable.dart';

import 'package:flutter_application/core/use_cases/no_params.dart';
import 'package:flutter_application/core/use_cases/use_case.dart';
import 'package:flutter_application/features/auth/domain/repository/auth_repository.dart';

@injectable
class LogoutUseCase extends UseCase<Future<void>, NoParams> {
  LogoutUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<void> execute(NoParams params) {
    return _authRepository.logout();
  }
}
