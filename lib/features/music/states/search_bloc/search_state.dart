part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading(
      {List<MusicModel>? songs, @Default(true) bool isLoading}) = _Loading;

  const factory SearchState.loaded(
      {required List<MusicModel> songs,
      @Default(false) bool isLoading}) = _Loaded;

  const factory SearchState.error(
      {required String error,
      List<MusicModel>? songs,
      @Default(false) bool isLoading}) = _Error;

  const factory SearchState.cleared(
      {@Default(<MusicModel>[]) List<MusicModel> songs,
      @Default(false) bool isLoading,
      @Default(true) bool isCleared}) = _Cleared;
}
