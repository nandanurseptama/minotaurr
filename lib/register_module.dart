
import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/env.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

@module
abstract class RegisterModule {
  Uuid get uuid => const Uuid();
  Dio get httpRestClient => Dio();
  Env get env => Env.create(
      envName: const String.fromEnvironment("env_name", defaultValue: "ENV"));
  @preResolve
  Future<SharedPreferences> get localStorage => SharedPreferences.getInstance();
  
}