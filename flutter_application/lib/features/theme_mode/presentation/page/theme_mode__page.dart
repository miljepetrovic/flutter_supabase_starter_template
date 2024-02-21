import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/core/extensions/string_extensions.dart';
import 'package:flutter_application/features/theme_mode/presentation/bloc/theme_mode_cubit.dart';

class ThemeModePage extends StatelessWidget {
  const ThemeModePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme mode"),
      ),
      body: SafeArea(
        child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
          buildWhen: (previous, current) => previous.selectedThemeMode != current.selectedThemeMode,
          builder: (context, state) {
            return ListView(
                children: state.modes
                    .map((mode) => RadioListTile(
                          title: Text(mode.name.capitalize()), // Display the title for option 1
                          value: mode.index, // Assign a value of 1 to this option
                          groupValue: state.selectedThemeMode
                              .index, // Use _selectedValue to track the selected option
                          onChanged: (value) => context.read<ThemeModeCubit>().setTheme(value),
                        ))
                    .toList());
          },
        ),
      ),
    );
  }
}
