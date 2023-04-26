import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/domain/music_repository.dart';

@lazySingleton
class FindSongsUsecase extends Usecase<String, List<MusicModel>> {
  final MusicRepository _musicRepository;
  FindSongsUsecase(
      {required super.uuidGenerator,
      @preResolve required MusicRepository musicRepository})
      : _musicRepository = musicRepository;

  @override
  Future<List<MusicModel>> calling(String params) {
    return _musicRepository.findSongs(keyword: params, processId: processId);
  }
}
