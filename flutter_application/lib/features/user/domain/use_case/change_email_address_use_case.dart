import 'package:flutter_application/core/use_cases/use_case.dart';
import 'package:flutter_application/features/user/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeEmailAddressUseCase extends UseCase<void, ChangeEmailAddressUseCaseParams> {
  ChangeEmailAddressUseCase(
    this._userRepository,
  );

  final UserRepository _userRepository;

  @override
  Future<void> execute(ChangeEmailAddressUseCaseParams params) {
    return _userRepository.changeEmailAddress(params.email);
  }
}

class ChangeEmailAddressUseCaseParams {
  ChangeEmailAddressUseCaseParams({
    required this.email,
  });

  final String email;
}
