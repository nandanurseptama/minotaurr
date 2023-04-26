part of 'artists_bloc.dart';

@freezed
class ArtistsEvent with _$ArtistsEvent {
  const factory ArtistsEvent.loadPopularArtist() = _LoadPopularArtist;
}