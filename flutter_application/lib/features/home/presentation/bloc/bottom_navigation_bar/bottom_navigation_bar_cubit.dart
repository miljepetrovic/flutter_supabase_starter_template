import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/presentation/widgets/welcome_content.dart';
import 'package:flutter_application/features/settings/presentation/page/settings_page.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_state.dart';

@injectable
class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit()
      : super(
          BottomNavigationBarState(),
        );

  void switchTab(int index) {
    emit(state.copyWith(
      selectedIndex: index,
    ));
  }
}
