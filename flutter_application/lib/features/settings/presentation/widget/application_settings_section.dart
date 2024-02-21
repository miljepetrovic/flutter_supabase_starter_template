import 'package:flutter/material.dart';
import 'package:flutter_application/features/settings/presentation/widget/settings_section.dart';
import 'package:flutter_application/features/theme_mode/presentation/widget/theme_mode_settings_tile.dart';

class ApplicationSettingsSection extends StatelessWidget {
  const ApplicationSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsSection(
      title: "Application",
      items: [
        ThemeModeSettingsTile(),
      ],
    );
  }
}
