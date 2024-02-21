import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/spacings.dart';
import 'package:flutter_application/features/settings/presentation/widget/account_settings_section.dart';
import 'package:flutter_application/features/settings/presentation/widget/help_settings_section.dart';
import 'package:flutter_application/features/settings/presentation/widget/application_settings_section.dart';
import 'package:flutter_application/features/settings/presentation/widget/info_settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: Spacing.s8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoSettingsSection(),
              SizedBox(height: Spacing.s16),
              HelpSettingsSection(),
              SizedBox(height: Spacing.s16),
              ApplicationSettingsSection(),
              SizedBox(height: Spacing.s16),
              AccountSettingsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
