import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/usecase/usecase.dart';
import 'package:minotaur/features/music/domain/music_repository.dart';

@lazySingleton
class GetPopularArtistsUsecase extends Usecase<NoUsecaseParams, List<String>> {
  final MusicRepository _musicRepository;
  GetPopularArtistsUsecase(
      {@preResolve required super.uuidGenerator,
      @preResolve required MusicRepository musicRepository})
      : _musicRepository = musicRepository;

  @override
  Future<List<String>> calling(NoUsecaseParams params) {
    return _musicRepository.getPopularArtist();
  }
}
