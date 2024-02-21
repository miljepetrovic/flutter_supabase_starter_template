part of 'bottom_navigation_bar_cubit.dart';

@immutable
class BottomNavigationBarState extends Equatable {
  BottomNavigationBarState({
    this.selectedIndex = 0,
  });

  final int selectedIndex;
  final tabs = <TabItem>[
    const TabItem(
      label: "Home",
      icon: Icons.home,
      tooltip: "Home",
      content: WelcomeContent(),
    ),
    const TabItem(
      label: "Settings",
      icon: Icons.settings,
      tooltip: "Settings",
      content: SettingsPage(),
    ),
  ];

  BottomNavigationBarState copyWith({int? selectedIndex}) {
    return BottomNavigationBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        tabs,
      ];
}

class TabItem {
  const TabItem({
    required this.tooltip,
    required this.label,
    required this.icon,
    required this.content,
  });

  final IconData icon;
  final String label;
  final String tooltip;
  final Widget content;
}
