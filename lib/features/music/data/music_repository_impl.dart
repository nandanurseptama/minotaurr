import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:minotaur/cores/env.dart';
import 'package:minotaur/cores/usecase/repository_error_handler.dart';
import 'package:minotaur/features/music/data/models/music_model.dart';
import 'package:minotaur/features/music/domain/music_repository.dart';

@LazySingleton(
  as: MusicRepository,
)
class MusicRepositoryImpl implements MusicRepository {
  final Dio _restApiClient;
  final Env _env;

  MusicRepositoryImpl(
      {@preResolve required Dio restApiClient, @preResolve required Env env})
      : _restApiClient = restApiClient,
        _env = env;
  @override
  Future<List<String>> getPopularArtist() async {
    return [
      "Maroon 5",
      "Dream Theater",
      "Bonjovi",
      "Kangen Band",
      "Dewa 19",
    ];
  }

  @override
  Future<List<MusicModel>> getMusicByArtistName(
      {required String processId, required String artistName}) async {
    try {
      var response = await _restApiClient.get(_env.findMusicEndPoint,
          queryParameters: {
            "media": "music",
            "attribute": "artistTerm",
            "explicit": true,
            "entity": "song",
            "term": artistName,
            "limit": "5"
          },
          options: Options(headers: {
            "Request-Id": processId,
          }));
      var responseBody = jsonDecode(response.data ?? "{}");

      if (responseBody['results'] == null) {
        return [];
      }
      if ((responseBody['results'] as List).isEmpty) {
        return [];
      }
      return (responseBody['results'] as List)
          .map((e) => MusicModel.fromJson(e))
          .toList();
    } catch (e, trace) {
      throw repositoryErrorHandler(err: e, processId: processId, trace: trace);
    }
  }

  @override
  Future<List<MusicModel>> findSongs(
      {required String keyword, required String processId}) async {
    try {
      var response = await _restApiClient.get(_env.findMusicEndPoint,
          queryParameters: {
            "media": "music",
            "explicit": true,
            "entity": "song",
            "term": keyword,
            "limit": "20"
          },
          options: Options(headers: {
            "Request-Id": processId,
          }));
      var responseBody = jsonDecode(response.data ?? "{}");

      if (responseBody['results'] == null) {
        return [];
      }
      if ((responseBody['results'] as List).isEmpty) {
        return [];
      }
      return (responseBody['results'] as List)
          .map((e) => MusicModel.fromJson(e))
          .toList();
    } catch (e, trace) {
      throw repositoryErrorHandler(err: e, processId: processId, trace: trace);
    }
  }
}
