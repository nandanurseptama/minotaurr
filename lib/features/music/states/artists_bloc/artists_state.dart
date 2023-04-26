part of 'artists_bloc.dart';

@freezed
class ArtistsState with _$ArtistsState {
  factory ArtistsState.loading({
    List<String>? artists,
    @Default(true)  bool isLoading,
  }) = _Loading;

  const factory ArtistsState.loaded({
    required List<String> artists,
    @Default(false) bool isLoading,
  }) = _Loaded;

  const factory ArtistsState.error({
    required String error,
    List<String>? artists,
     @Default(false)  bool isLoading,
  }) = _Error;
}
