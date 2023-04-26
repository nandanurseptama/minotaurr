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
import 'package:uuid/uuid.dart' as _i7;

import 'cores/env.dart' as _i4;
import 'cores/utils/uuid_generator.dart' as _i8;
import 'features/music/data/music_repository_impl.dart' as _i6;
import 'features/music/domain/music_repository.dart' as _i5;
import 'features/music/domain/usecases/find_songs_by_artist_name_usecase.dart'
    as _i9;
import 'features/music/domain/usecases/get_popular_artists_usecase.dart'
    as _i10;
import 'features/music/states/artists_bloc/artists_bloc.dart' as _i12;
import 'features/music/states/song_by_artist/songs_by_artist_bloc.dart' as _i11;
import 'register_module.dart' as _i13;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $Init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.httpRestClient);
  gh.factory<_i4.Env>(() => registerModule.env);
  gh.factory<_i5.MusicRepository>(() => _i6.MusicRepositoryImpl(
        restApiClient: gh<_i3.Dio>(),
        env: gh<_i4.Env>(),
      ));
  gh.factory<_i7.Uuid>(() => registerModule.uuid);
  gh.factory<_i8.UUIDGenerator>(() => _i8.UUIDGenerator(uuid: gh<_i7.Uuid>()));
  gh.factory<_i9.FindSongsByArtistNameUsecase>(
      () => _i9.FindSongsByArtistNameUsecase(
            uuidGenerator: gh<_i8.UUIDGenerator>(),
            musicRepository: gh<_i5.MusicRepository>(),
          ));
  gh.factory<_i10.GetPopularArtistsUsecase>(() => _i10.GetPopularArtistsUsecase(
        uuidGenerator: gh<_i8.UUIDGenerator>(),
        musicRepository: gh<_i5.MusicRepository>(),
      ));
  gh.lazySingleton<_i11.SongsByArtistBloc>(() => _i11.SongsByArtistBloc(
      findSongsByArtistNameUsecase: gh<_i9.FindSongsByArtistNameUsecase>()));
  gh.lazySingleton<_i12.ArtistsBloc>(() => _i12.ArtistsBloc(
        getPopularArtistsUsecase: gh<_i10.GetPopularArtistsUsecase>(),
        songsByArtistBloc: gh<_i11.SongsByArtistBloc>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
