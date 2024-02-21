import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

@module
abstract class AppModule {
  SupabaseClient get supabaseClient => Supabase.instance.client;
  GoTrueClient get supabaseAuth => Supabase.instance.client.auth;
  FunctionsClient get functionsClient => Supabase.instance.client.functions;
}
