// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application/core/app/app_module.dart' as _i23;
import 'package:flutter_application/features/auth/data/repository/supabase_auth_repository.dart'
    as _i11;
import 'package:flutter_application/features/auth/domain/repository/auth_repository.dart'
    as _i10;
import 'package:flutter_application/features/auth/domain/use_case/get_current_auth_state_use_case.dart'
    as _i13;
import 'package:flutter_application/features/auth/domain/use_case/get_logged_in_user_use_case.dart'
    as _i14;
import 'package:flutter_application/features/auth/domain/use_case/login_with_email_use_case.dart'
    as _i16;
import 'package:flutter_application/features/auth/domain/use_case/logout_use_case.dart'
    as _i17;
import 'package:flutter_application/features/auth/presentation/bloc/auth_bloc.dart'
    as _i20;
import 'package:flutter_application/features/auth/presentation/bloc/login/login_cubit.dart'
    as _i22;
import 'package:flutter_application/features/home/presentation/bloc/bottom_navigation_bar/bottom_navigation_bar_cubit.dart'
    as _i3;
import 'package:flutter_application/features/theme_mode/data/repository/theme_mode_hive_repository.dart'
    as _i6;
import 'package:flutter_application/features/theme_mode/domain/repository/theme_mode_repository.dart'
    as _i5;
import 'package:flutter_application/features/theme_mode/domain/use_case/get_or_set_initial_theme_mode_use_case.dart'
    as _i15;
import 'package:flutter_application/features/theme_mode/domain/use_case/set_theme_mode_id_use_case.dart'
    as _i18;
import 'package:flutter_application/features/theme_mode/presentation/bloc/theme_mode_cubit.dart'
    as _i19;
import 'package:flutter_application/features/user/data/repository/supabase_user_repository.dart'
    as _i8;
import 'package:flutter_application/features/user/domain/repository/user_repository.dart'
    as _i7;
import 'package:flutter_application/features/user/domain/use_case/change_email_address_use_case.dart'
    as _i12;
import 'package:flutter_application/features/user/presentation/bloc/change_email_address/change_email_address_cubit.dart'
    as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:supabase/supabase.dart' as _i9;
import 'package:supabase_flutter/supabase_flutter.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.BottomNavigationBarCubit>(
        () => _i3.BottomNavigationBarCubit());
    gh.factory<_i4.FunctionsClient>(() => appModule.functionsClient);
    gh.factory<_i4.GoTrueClient>(() => appModule.supabaseAuth);
    gh.factory<_i4.SupabaseClient>(() => appModule.supabaseClient);
    gh.factory<_i5.ThemeModeRepository>(() => _i6.ThemeModeHiveRepository());
    gh.factory<_i7.UserRepository>(() => _i8.SupabaseUserRepository(
          gh<_i9.GoTrueClient>(),
          gh<_i9.FunctionsClient>(),
        ));
    gh.factory<_i10.AuthRepository>(
        () => _i11.SupabaseAuthRepository(gh<_i4.GoTrueClient>()));
    gh.factory<_i12.ChangeEmailAddressUseCase>(
        () => _i12.ChangeEmailAddressUseCase(gh<_i7.UserRepository>()));
    gh.factory<_i13.GetCurrentAuthStateUseCase>(
        () => _i13.GetCurrentAuthStateUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i14.GetLoggedInUserUseCase>(
        () => _i14.GetLoggedInUserUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i15.GetOrSetInitialThemeModeUseCase>(() =>
        _i15.GetOrSetInitialThemeModeUseCase(gh<_i5.ThemeModeRepository>()));
    gh.factory<_i16.LoginWithEmailUseCase>(
        () => _i16.LoginWithEmailUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i17.LogoutUseCase>(
        () => _i17.LogoutUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i18.SetThemeModeUseCase>(
        () => _i18.SetThemeModeUseCase(gh<_i5.ThemeModeRepository>()));
    gh.factory<_i19.ThemeModeCubit>(() => _i19.ThemeModeCubit(
          gh<_i15.GetOrSetInitialThemeModeUseCase>(),
          gh<_i18.SetThemeModeUseCase>(),
        ));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
          gh<_i14.GetLoggedInUserUseCase>(),
          gh<_i13.GetCurrentAuthStateUseCase>(),
          gh<_i17.LogoutUseCase>(),
        ));
    gh.factory<_i21.ChangeEmailAddressCubit>(() =>
        _i21.ChangeEmailAddressCubit(gh<_i12.ChangeEmailAddressUseCase>()));
    gh.factory<_i22.LoginCubit>(
        () => _i22.LoginCubit(gh<_i16.LoginWithEmailUseCase>()));
    return this;
  }
}

class _$AppModule extends _i23.AppModule {}
