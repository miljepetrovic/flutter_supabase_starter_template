import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/urls.dart';
import 'package:flutter_application/core/extensions/build_context_extensions.dart';
import 'package:flutter_application/core/extensions/string_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/spacings.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Flutter Supabase Starter"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome",
                  style: context.textTheme.headlineMedium,
                ),
                const SizedBox(height: Spacing.s16),
                const _AuthorInfo(),
                const SizedBox(height: Spacing.s16),
                Text(
                  "Contact",
                  style: context.textTheme.headlineMedium,
                ),
                const SizedBox(height: Spacing.s16),
                _ContactDetails(),
                const SizedBox(height: Spacing.s16),
                Text(
                  "Available features",
                  style: context.textTheme.headlineMedium,
                ),
                const SizedBox(height: Spacing.s16),
                _FeaturesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  const _AuthorInfo();

  @override
  Widget build(BuildContext context) {
    return const Card.filled(
      child: Padding(
        padding: EdgeInsets.all(Spacing.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Hi"),
                SizedBox(width: Spacing.s8),
                Icon(Icons.waving_hand),
              ],
            ),
            SizedBox(height: Spacing.s16),
            Text("I am Milan Petrovic, Software Engineer."),
            SizedBox(height: Spacing.s16),
            Text(
              "Thank you for choosing our Flutter Supabase Starter to save 20+ hours of development time.",
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  _ContactDetails();

  final _contactItems = [
    _ContactItem(
      label: "LinkedIn",
      description: "Connect with me on LinkedIn.",
      url: Urls.linkedin,
    ),
    _ContactItem(
      label: "Medium",
      description: "Follow me on Medium.",
      url: Urls.medium,
    ),
    _ContactItem(
      label: "Twitter",
      description: "Follow me on Twitter.",
      url: Urls.twitter,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: _contactItems
                  .map((contactItem) => ListTile(
                        leading: const Icon(Icons.link),
                        title: Text(contactItem.label),
                        subtitle: Text(contactItem.description),
                        onTap: () => launchUrl(
                          Uri.parse(contactItem.url),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class _ContactItem {
  _ContactItem({
    required this.label,
    required this.description,
    required this.url,
  });

  final String label;
  final String description;
  final String url;
}

class _FeaturesList extends StatelessWidget {
  _FeaturesList();

  final _features = [
    _Feature(
        title: "Clean Architecture",
        description: "Feature-first approach with domain, data and presentation layers."),
    _Feature(title: "Dependency injection", description: "Implemented using GetIt and Injectable."),
    _Feature(title: "State management with BLoC"),
    _Feature(title: "Navigation with GoRouter"),
    _Feature(title: "Dark Mode", description: "Theme setup with Dark Mode."),
    _Feature(title: "Supabase integration"),
    _Feature(title: "Authentication", description: "Login with magic link and logout."),
    _Feature(
        title: "Settings page",
        description: "Change email address, privacy policy, terms of service, app info."),
    _Feature(title: "Flutter Native Splash"),
    _Feature(title: "Flutter Launcher Icons"),
    _Feature(title: "Google Fonts"),
  ];

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: _features
                  .map((feature) => ListTile(
                        leading: const Icon(Icons.rocket_launch),
                        title: Text(feature.title),
                        subtitle:
                            !feature.description.isNullOrEmpty ? Text(feature.description!) : null,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class _Feature {
  _Feature({
    required this.title,
    this.description,
  });

  final String title;
  final String? description;
}
