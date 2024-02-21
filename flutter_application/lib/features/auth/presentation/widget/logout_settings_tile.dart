import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_application/core/router/routes.dart";
import "package:flutter_application/core/utils/dialog_utils.dart";
import "package:flutter_application/features/auth/presentation/bloc/auth_bloc.dart";
import "package:go_router/go_router.dart";

import "../../../../core/constants/colors.dart";

class LogoutSettingsTile extends StatelessWidget {
  const LogoutSettingsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.exit_to_app,
        color: AppColors.red,
      ),
      title: const Text(
        "Logout",
        style: TextStyle(
          color: AppColors.red,
        ),
      ),
      onTap: () => _showLogOutConfirmationDialog(context),
    );
  }

  Future<void> _showLogOutConfirmationDialog(
    BuildContext context,
  ) async {
    final confirmed = await DialogUtils.showConfirmationDialog(
      context,
      title: "Logout",
      message: "Are you sure you want to logout?",
      confirmText: "Logout",
    );

    if (confirmed && context.mounted) {
      context.read<AuthBloc>().add(const AuthLogoutButtonPressed());
      context.go(Routes.login.path);
    }
  }
}
