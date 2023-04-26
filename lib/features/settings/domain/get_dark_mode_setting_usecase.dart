import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GetDarkModeSettingUsecase extends Usecase<NoUsecaseParams, bool> {
  final SharedPreferences _localStorage;
  GetDarkModeSettingUsecase(
      {required super.uuidGenerator,
      @preResolve required SharedPreferences localStorage})
      : _localStorage = localStorage;

  @override
  Future<bool> calling(NoUsecaseParams params) async {
    var isActive = _localStorage.getBool("isDarkModeActive") ?? false;
    return isActive;
  }
}
