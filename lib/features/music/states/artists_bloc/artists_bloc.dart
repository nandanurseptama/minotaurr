import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:minotaur/features/music/domain/usecases/get_popular_artists_usecase.dart';
import 'package:minotaur/features/music/states/song_by_artist/songs_by_artist_bloc.dart';

part 'artists_event.dart';
part 'artists_state.dart';

part 'artists_bloc.freezed.dart';

@lazySingleton
class ArtistsBloc extends Bloc<ArtistsEvent, ArtistsState> {
  final SongsByArtistBloc _songsByArtistBloc;
  final GetPopularArtistsUsecase _getPopularArtistsUsecase;
  @override
  onChange(Change<ArtistsState> change) {
    super.onChange(change);
    loadSongsByArtists(change.nextState.artists ?? []);
  }
  void loadSongsByArtists(List<String> artists){
    if(artists.isEmpty){
      return;
    }
    for(var i=0; i<artists.length; i++){
      if(artists[i].isEmpty){
        continue;
      }
      _songsByArtistBloc.add(SongsByArtistEvent.loadSongs(artists[i]));
    }
  }

  ArtistsBloc(
      {@preResolve required GetPopularArtistsUsecase getPopularArtistsUsecase,
      @preResolve required SongsByArtistBloc songsByArtistBloc})
      : _getPopularArtistsUsecase = getPopularArtistsUsecase,
        _songsByArtistBloc = songsByArtistBloc,
        super(ArtistsState.loading()) {
    on<ArtistsEvent>((event, emit) {
      return event.maybeMap<void>(
        loadPopularArtist: (value) async {
          await _loadPopularArtistEventCallback(emit: emit);
          return;
        },
        orElse: () {
          return;
        },
      );
    });
  }
  Future<void> _loadPopularArtistEventCallback(
      {required Emitter<ArtistsState> emit}) async {
    emit(ArtistsState.loading(artists: state.artists ?? []));
    var result = await _getPopularArtistsUsecase(NoUsecaseParams());
    return result.map<void>(ok: (ok) {
      emit(ArtistsState.loaded(artists: ok.data));
      return;
    }, err: (err) {
      emit(ArtistsState.error(
          error: err.data.message, artists: state.artists ?? []));
      return;
    });
  }
}
