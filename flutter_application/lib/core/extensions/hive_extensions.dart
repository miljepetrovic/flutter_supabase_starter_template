import 'package:hive/hive.dart';

const _themeBoxName = "themeMode";

extension ThemeModeBoxExtension on HiveInterface {
  Future<Box> openThemeModeBox() async {
    return await openBox(_themeBoxName);
  }

  Box get themeModeBox => box(_themeBoxName);
}
