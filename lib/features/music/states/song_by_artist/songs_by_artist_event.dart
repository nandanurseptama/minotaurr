part of 'songs_by_artist_bloc.dart';

@freezed
class SongsByArtistEvent with _$SongsByArtistEvent {
  const factory SongsByArtistEvent.loadSongs(String artistName) = _LoadSongs;
}