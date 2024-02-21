import 'package:flutter/material.dart';
import 'package:flutter_application/core/extensions/build_context_extensions.dart';
import 'package:flutter_application/core/extensions/string_extensions.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.trailing,
  });

  final IconData leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leading),
      title: Text(
        title,
        style: context.textTheme.titleMedium,
      ),
      subtitle: !subtitle.isNullOrEmpty
          ? Text(
              subtitle!,
              style: context.textTheme.bodySmall,
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
