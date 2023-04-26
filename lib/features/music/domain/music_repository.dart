import 'package:minotaur/features/music/data/models/music_model.dart';

/// Music Repository
///
/// Music Repository data from remote datasource or local data
abstract class MusicRepository {
  Future<List<String>> getPopularArtist();
  /// get music by artist name
  /// 
  /// will return List of Music filtered by artistName
  Future<List<MusicModel>> getMusicByArtistName({
    required String artistName,
    required String processId
  });
  /// search music by within keyword
  /// 
  /// will return List of Music that match with the keyword
  Future<List<MusicModel>> findSongs({
    required String keyword,
    required String processId
  });
}