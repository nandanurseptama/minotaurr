import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SetDarkModeSettingUsecase extends Usecase<bool, bool> {
  final SharedPreferences _localStorage;
  SetDarkModeSettingUsecase(
      {required super.uuidGenerator,
      @preResolve required SharedPreferences localStorage})
      : _localStorage = localStorage;

  @override
  Future<bool> calling(bool params) async {
    return await _localStorage.setBool("isDarkModeActive", params);
  }
}
