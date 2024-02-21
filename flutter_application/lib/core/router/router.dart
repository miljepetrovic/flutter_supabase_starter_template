import 'package:flutter_application/core/router/routes.dart';
import 'package:flutter_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application/features/home/presentation/home_page.dart';
import 'package:flutter_application/features/theme_mode/presentation/page/theme_mode__page.dart';
import 'package:flutter_application/features/user/presentation/page/change_email_address_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/page/login_page.dart';
import '../../features/settings/presentation/page/settings_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.initial.name,
      path: Routes.initial.path,
      builder: (context, state) => BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthUserAuthenticated) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    ),
    GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: Routes.home.name,
      path: Routes.home.path,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: Routes.settings.name,
      path: Routes.settings.path,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      name: Routes.changeEmailAddress.name,
      path: Routes.changeEmailAddress.path,
      builder: (context, state) => const ChangeEmailAddressPage(),
    ),
    GoRoute(
      name: Routes.themeMode.name,
      path: Routes.themeMode.path,
      builder: (context, state) => const ThemeModePage(),
    ),
  ],
);
