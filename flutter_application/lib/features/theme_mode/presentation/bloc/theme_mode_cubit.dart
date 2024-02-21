import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/theme_mode/domain/use_case/get_or_set_initial_theme_mode_use_case.dart';
import 'package:flutter_application/features/theme_mode/domain/use_case/set_theme_mode_id_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'theme_mode_state.dart';

@injectable
class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit(
    this._getOrSetInitialThemeModeUseCase,
    this._setThemeModeUseCase,
  ) : super(
          const ThemeModeState(),
        );

  final GetOrSetInitialThemeModeUseCase _getOrSetInitialThemeModeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;

  void getCurrentTheme() {
    var systemThemeModeId = ThemeMode.system.index;

    var themeModeId = _getOrSetInitialThemeModeUseCase.execute(
      GetOrSetInitialThemeModeUseCaseParams(
        currentThemeModeId: systemThemeModeId,
      ),
    );

    emit(state.copyWith(
      selectedThemeMode: ThemeMode.values[themeModeId],
    ));
  }

  void setTheme(int? themeModeIndex) {
    if (themeModeIndex == null) return;

    _setThemeModeUseCase.execute(SetThemeModeUseCaseParams(
      themeModeIndex: themeModeIndex,
    ));

    emit(
      state.copyWith(
        selectedThemeMode: state.modes[themeModeIndex],
      ),
    );
  }
}
