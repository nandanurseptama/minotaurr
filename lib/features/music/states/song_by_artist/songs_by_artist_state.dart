part of 'songs_by_artist_bloc.dart';

@freezed
class SongsByArtistState with _$SongsByArtistState {
  const factory SongsByArtistState.loading(List<MusicModel> songs) = _Loading;
  const factory SongsByArtistState.loaded(List<MusicModel> songs) = _Loaded;
  const factory SongsByArtistState.error(String error, List<MusicModel> songs) =
      _Error;
}
