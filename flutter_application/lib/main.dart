import 'package:flutter/material.dart';
import 'package:flutter_application/core/extensions/hive_extensions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_application/core/app/app.dart';
import 'package:flutter_application/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeSupabase();
  await _initializeHive();
  configureDependencyInjection();

  runApp(
    const FlutterSupabaseStarterApp(),
  );
}

Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: "PROJECT_URL",
    anonKey: "PUBLIC_ANON_KEY",
  );
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  await Hive.openThemeModeBox();
}
