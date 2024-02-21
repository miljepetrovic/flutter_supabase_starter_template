import 'package:flutter/material.dart';
import 'package:flutter_application/features/settings/presentation/widget/settings_section.dart';
import 'package:flutter_application/features/user/presentation/widget/change_email_address_settings_tile.dart';

import '../../../auth/presentation/widget/logout_settings_tile.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SettingsSection(
      title: 'Account',
      items: [
        ChangeEmailAddressSettingsTile(),
        LogoutSettingsTile(),
      ],
    );
  }
}
