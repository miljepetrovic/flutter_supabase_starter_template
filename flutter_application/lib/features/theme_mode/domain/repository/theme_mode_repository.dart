import 'package:flutter/material.dart';

abstract class ThemeModeRepository {
  int getOrSetInitialThemeModeIndex(int defaultThemeModeIndex);
  void setThemeMode(int themeModeIndex);
}
