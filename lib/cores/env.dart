import 'package:equatable/equatable.dart';

/// env class
///
/// inherit this class to create new environment
abstract class Env extends Equatable {
  String get name;
  String get findMusicEndPoint;

  factory Env.create({String envName = "DEV"}) {
    if(envName == "DEV"){
      return DevEnv();
    }
    return ProdEnv();
  }
}

class DevEnv implements Env {
  @override
  String get findMusicEndPoint => "https://itunes.apple.com/search";

  @override
  String get name => "DEV";

  @override
  List<Object?> get props => [
        name,
        findMusicEndPoint,
      ];

  @override
  bool? get stringify => true;
}
class ProdEnv implements Env {
  @override
  String get findMusicEndPoint => "https://itunes.apple.com/search";

  @override
  String get name => "PROD";

  @override
  List<Object?> get props => [
        name,
        findMusicEndPoint,
      ];

  @override
  bool? get stringify => true;
}
