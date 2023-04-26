import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/domain/usecases/find_songs_by_artist_name_usecase.dart';

part 'songs_by_artist_event.dart';
part 'songs_by_artist_state.dart';
part 'songs_by_artist_bloc.freezed.dart';

@lazySingleton
class SongsByArtistBloc
    extends Bloc<SongsByArtistEvent, Map<String, SongsByArtistState>> {
  final FindSongsByArtistNameUsecase _findSongByArtistNameUsecase;
  SongsByArtistBloc(
      {@preResolve
          required FindSongsByArtistNameUsecase findSongsByArtistNameUsecase})
      : _findSongByArtistNameUsecase = findSongsByArtistNameUsecase,
        super(<String, SongsByArtistState>{}) {
    on<SongsByArtistEvent>((event, emit) {
      return event.maybeMap<void>(loadSongs: (value) async {
        await loadSongsByArtistNameEventListener(
            artistName: value.artistName, emit: emit);
        return;
      }, orElse: () {
        return;
      });
    });
  }
  Future<void> loadSongsByArtistNameEventListener(
      {required String artistName,
      required Emitter<Map<String, SongsByArtistState>> emit}) async {
    emit({
      ...state,
      artistName: state[artistName.toLowerCase()] ??
          const SongsByArtistState.loading([])
    });
    return _findSongByArtistNameUsecase(artistName).then((result) {
      return result.when<void>(ok: (ok) {
        return emit({
          ...state,
          artistName.toLowerCase(): SongsByArtistState.loaded(ok)
        });
      }, err: (err) {
        return emit({
          ...state,
          artistName.toLowerCase(): SongsByArtistState.error(
            err.message,
            state[artistName.toLowerCase()] == null
                ? []
                : (state[artistName.toLowerCase()])!.songs,
          )
        });
      });
    });
  }
}
