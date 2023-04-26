import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/failure.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/domain/music_repository.dart';

@lazySingleton
class FindSongsByArtistNameUsecase extends Usecase<String, List<MusicModel>> {
  final MusicRepository _musicRepository;
  FindSongsByArtistNameUsecase(
      {@preResolve required super.uuidGenerator,
      @preResolve required MusicRepository musicRepository})
      : _musicRepository = musicRepository;

  @override
  Future<List<MusicModel>> calling(String params) {
    if (params.isEmpty) {
      throw Failure(
          message: "Artist name required",
          trace: StackTrace.current,
          processId: processId);
    }
    return _musicRepository.getMusicByArtistName(
        artistName: params, processId: processId);
  }
}
