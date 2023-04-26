// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:uuid/uuid.dart' as _i8;

import 'cores/env.dart' as _i4;
import 'cores/utils/uuid_generator.dart' as _i9;
import 'features/music/data/music_repository_impl.dart' as _i6;
import 'features/music/domain/music_repository.dart' as _i5;
import 'features/music/domain/usecases/find_songs_by_artist_name_usecase.dart'
    as _i10;
import 'features/music/domain/usecases/find_songs_usecase.dart' as _i11;
import 'features/music/domain/usecases/get_popular_artists_usecase.dart'
    as _i13;
import 'features/music/states/artists_bloc/artists_bloc.dart' as _i17;
import 'features/music/states/search_bloc/search_bloc.dart' as _i14;
import 'features/music/states/song_by_artist/songs_by_artist_bloc.dart' as _i16;
import 'features/settings/domain/get_dark_mode_setting_usecase.dart' as _i12;
import 'features/settings/domain/set_dark_mode_setting_usecase.dart' as _i15;
import 'features/settings/states/dark_mode_setting_cubit/dark_mode_setting_cubit.dart'
    as _i18;
import 'register_module.dart' as _i19;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $Init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.httpRestClient);
  gh.factory<_i4.Env>(() => registerModule.env);
  gh.lazySingleton<_i5.MusicRepository>(() => _i6.MusicRepositoryImpl(
        restApiClient: gh<_i3.Dio>(),
        env: gh<_i4.Env>(),
      ));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => registerModule.localStorage,
    preResolve: true,
  );
  gh.factory<_i8.Uuid>(() => registerModule.uuid);
  gh.factory<_i9.UUIDGenerator>(() => _i9.UUIDGenerator(uuid: gh<_i8.Uuid>()));
  gh.lazySingleton<_i10.FindSongsByArtistNameUsecase>(
      () => _i10.FindSongsByArtistNameUsecase(
            uuidGenerator: gh<_i9.UUIDGenerator>(),
            musicRepository: gh<_i5.MusicRepository>(),
          ));
  gh.lazySingleton<_i11.FindSongsUsecase>(() => _i11.FindSongsUsecase(
        uuidGenerator: gh<_i9.UUIDGenerator>(),
        musicRepository: gh<_i5.MusicRepository>(),
      ));
  gh.lazySingleton<_i12.GetDarkModeSettingUsecase>(
      () => _i12.GetDarkModeSettingUsecase(
            uuidGenerator: gh<_i9.UUIDGenerator>(),
            localStorage: gh<_i7.SharedPreferences>(),
          ));
  gh.lazySingleton<_i13.GetPopularArtistsUsecase>(
      () => _i13.GetPopularArtistsUsecase(
            uuidGenerator: gh<_i9.UUIDGenerator>(),
            musicRepository: gh<_i5.MusicRepository>(),
          ));
  gh.lazySingleton<_i14.SearchBloc>(
      () => _i14.SearchBloc(findSongsUsecase: gh<_i11.FindSongsUsecase>()));
  gh.lazySingleton<_i15.SetDarkModeSettingUsecase>(
      () => _i15.SetDarkModeSettingUsecase(
            uuidGenerator: gh<_i9.UUIDGenerator>(),
            localStorage: gh<_i7.SharedPreferences>(),
          ));
  gh.lazySingleton<_i16.SongsByArtistBloc>(() => _i16.SongsByArtistBloc(
      findSongsByArtistNameUsecase: gh<_i10.FindSongsByArtistNameUsecase>()));
  gh.lazySingleton<_i17.ArtistsBloc>(() => _i17.ArtistsBloc(
        getPopularArtistsUsecase: gh<_i13.GetPopularArtistsUsecase>(),
        songsByArtistBloc: gh<_i16.SongsByArtistBloc>(),
      ));
  gh.lazySingleton<_i18.DarkModeSettingCubit>(() => _i18.DarkModeSettingCubit(
        getDarkModeSettingUsecase: gh<_i12.GetDarkModeSettingUsecase>(),
        setDarkModeSettingUsecase: gh<_i15.SetDarkModeSettingUsecase>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i19.RegisterModule {}
