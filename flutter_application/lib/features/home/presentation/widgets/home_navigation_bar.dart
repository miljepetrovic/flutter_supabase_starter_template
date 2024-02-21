import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.tabs,
  });

  final int selectedIndex;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) => context.read<BottomNavigationBarCubit>().switchTab(index),
      destinations: tabs
          .map((tab) => NavigationDestination(
                label: tab.label,
                icon: Icon(tab.icon),
              ))
          .toList(),
    );
  }
}
