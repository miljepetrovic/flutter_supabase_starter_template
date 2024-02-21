part of 'theme_mode_cubit.dart';

@immutable
class ThemeModeState extends Equatable {
  const ThemeModeState({
    this.selectedThemeMode = ThemeMode.system,
    this.modes = ThemeMode.values,
  });

  final ThemeMode selectedThemeMode;
  final List<ThemeMode> modes;

  ThemeModeState copyWith({
    ThemeMode? selectedThemeMode,
    List<ThemeMode>? modes,
  }) {
    return ThemeModeState(
      selectedThemeMode: selectedThemeMode ?? this.selectedThemeMode,
      modes: modes ?? this.modes,
    );
  }

  @override
  List<Object?> get props => [
        selectedThemeMode,
        modes,
      ];
}
