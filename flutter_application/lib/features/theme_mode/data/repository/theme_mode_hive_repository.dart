import 'package:flutter_application/core/extensions/hive_extensions.dart';
import 'package:flutter_application/features/theme_mode/domain/repository/theme_mode_repository.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ThemeModeRepository)
class ThemeModeHiveRepository implements ThemeModeRepository {
  final Box themeModeBox = Hive.themeModeBox;

  final _themeModeIdKey = "themeModeId";

  @override
  int getOrSetInitialThemeModeIndex(int defaultThemeModeIndex) {
    if (defaultThemeModeIndex < 0) {
      throw ArgumentError("Theme mode id count not be less than 0.");
    }

    return themeModeBox.get(
      _themeModeIdKey,
      defaultValue: defaultThemeModeIndex,
    );
  }

  @override
  void setThemeMode(int themeModeId) {
    if (themeModeId < 0) {
      throw ArgumentError("Theme mode id count not be less than 0.");
    }

    themeModeBox.put(
      _themeModeIdKey,
      themeModeId,
    );
  }
}
