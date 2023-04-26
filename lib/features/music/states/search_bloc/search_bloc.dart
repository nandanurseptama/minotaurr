import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/domain/usecases/find_songs_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@lazySingleton
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FindSongsUsecase _findSongsUsecase;
  SearchBloc({@preResolve required FindSongsUsecase findSongsUsecase})
      : _findSongsUsecase = findSongsUsecase,
        super(const SearchState.cleared()) {
    on<SearchEvent>((event, emit) {
      return event.maybeMap<void>(
          search: (value) async {
            await _searchSongEventListener(keyword: value.keyword, emit: emit);
            return;
          },
          clearSearchResult: (value) {
            _clearSongEventFilter(emit: emit);
            return;
          },
          orElse: () {});
    });
  }
  Future<void> _searchSongEventListener({
    required String keyword,
    required Emitter<SearchState> emit,
  }) async {
    emit(const SearchState.loading());
    return _findSongsUsecase(keyword).then((result) {
      return result.when<void>(ok: (ok) {
        emit(SearchState.loaded(
          songs: ok,
        ));
        return;
      }, err: (err) {
        emit(SearchState.error(error: err.message));
        return;
      });
    });
  }

  void _clearSongEventFilter({
    required Emitter<SearchState> emit,
  }) {
    emit(const SearchState.cleared());
    return;
  }
}
