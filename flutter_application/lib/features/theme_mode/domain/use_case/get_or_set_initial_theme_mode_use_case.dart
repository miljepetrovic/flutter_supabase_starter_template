import 'package:equatable/equatable.dart';
import 'package:flutter_application/core/use_cases/use_case.dart';
import 'package:flutter_application/features/theme_mode/domain/repository/theme_mode_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrSetInitialThemeModeUseCase extends UseCase<int, GetOrSetInitialThemeModeUseCaseParams> {
  GetOrSetInitialThemeModeUseCase(
    this._themeModeRepository,
  );

  final ThemeModeRepository _themeModeRepository;

  @override
  int execute(GetOrSetInitialThemeModeUseCaseParams params) {
    return _themeModeRepository.getOrSetInitialThemeModeIndex(
      params.currentThemeModeId,
    );
  }
}

class GetOrSetInitialThemeModeUseCaseParams extends Equatable {
  const GetOrSetInitialThemeModeUseCaseParams({
    required this.currentThemeModeId,
  });

  final int currentThemeModeId;

  @override
  List<Object?> get props => [
        currentThemeModeId,
      ];
}
