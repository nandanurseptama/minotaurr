import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_model.g.dart';

@JsonSerializable(
  checked: true,
)
class MusicModel extends Equatable {
  @JsonKey(name: 'trackName', disallowNullValue: false, defaultValue: "")
  final String trackName;

  @JsonKey(name: 'artistName', disallowNullValue: false, defaultValue: "")
  final String artistName;

  @JsonKey(name: 'previewUrl', disallowNullValue: false, defaultValue: "")
  final String previewUrl;

  @JsonKey(name: 'artworkUrl100', disallowNullValue: false, defaultValue: "")
  final String artworkUrl100;

  const MusicModel(
      {required this.trackName,
      required this.artworkUrl100,
      required this.previewUrl,
      required this.artistName});

  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);
  static MusicModel example() {
    return const MusicModel(
        trackName: "Girls Like You (feat. Cardi B)",
        artworkUrl100:
            "https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/78/65/da/7865da2b-2786-2e5d-935a-887021d327ef/18UMGIM26510.rgb.jpg/100x100bb.jpg",
        previewUrl:
            "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/fb/cf/0f/fbcf0ff7-b1cc-d90c-88ae-041b212bbbd8/mzaf_16418641854287890302.plus.aac.p.m4a",
        artistName: "Marron 5");
  }

  @override
  List<Object?> get props => [
        trackName,
        artworkUrl100,
      ];
}
