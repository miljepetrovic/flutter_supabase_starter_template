import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/dependency_injection.dart';
import 'package:flutter_application/features/home/presentation/bloc/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:flutter_application/features/home/presentation/widgets/home_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomNavigationBarCubit>(),
      child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        buildWhen: (previous, current) => current.selectedIndex != previous.selectedIndex,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: state.tabs[state.selectedIndex].content,
            ),
            bottomNavigationBar: HomeNavigationBar(
              selectedIndex: state.selectedIndex,
              tabs: state.tabs,
            ),
          );
        },
      ),
    );
  }
}
