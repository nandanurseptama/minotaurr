import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:minotaur/features/settings/domain/get_dark_mode_setting_usecase.dart';
import 'package:minotaur/features/settings/domain/set_dark_mode_setting_usecase.dart';

/// Creates Dark Mode Setting
@lazySingleton
class DarkModeSettingCubit extends Cubit<bool> {
  final GetDarkModeSettingUsecase _getDarkModeSettingUsecase;
  final SetDarkModeSettingUsecase _setDarkModeSettingUsecase;
  DarkModeSettingCubit({
    @preResolve required GetDarkModeSettingUsecase getDarkModeSettingUsecase,
    @preResolve required SetDarkModeSettingUsecase setDarkModeSettingUsecase,
  })  : _getDarkModeSettingUsecase = getDarkModeSettingUsecase,
        _setDarkModeSettingUsecase = setDarkModeSettingUsecase,
        super(false) {
    getDarkModeSettingUsecase(NoUsecaseParams()).then((result) {
      loadDarkModeSetting();
    });
  }

  Future<void> loadDarkModeSetting() async {
    return _getDarkModeSettingUsecase(NoUsecaseParams()).then((result) {
      return result.when<void>(ok: (ok) {
        return emit(ok);
      }, err: (err) {
        return emit(false);
      });
    });
  }

  Future<void> setDarkModeSetting(bool value) async {
    return _setDarkModeSettingUsecase(value).then((result) {
      return result.when<void>(ok: (ok) {
        return emit(value);
      }, err: (err) {
        return emit(value);
      });
    });
  }
}
