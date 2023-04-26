import 'package:minotaur/features/music/data/models/music_model.dart';

/// Music Repository
///
/// Music Repository data from remote datasource or local data
abstract class MusicRepository {
  Future<List<String>> getPopularArtist();
  /// get music by genres
  /// 
  /// will return List of Music by filtered by genre
  Future<List<MusicModel>> getMusicByArtistName({
    required String artistName,
    required String processId
  });
}