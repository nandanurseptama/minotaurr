// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MusicModel',
      json,
      ($checkedConvert) {
        final val = MusicModel(
          trackName: $checkedConvert('trackName', (v) => v as String? ?? ''),
          artworkUrl100:
              $checkedConvert('artworkUrl100', (v) => v as String? ?? ''),
          previewUrl: $checkedConvert('previewUrl', (v) => v as String? ?? ''),
          artistName: $checkedConvert('artistName', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'trackName': instance.trackName,
      'artistName': instance.artistName,
      'previewUrl': instance.previewUrl,
      'artworkUrl100': instance.artworkUrl100,
    };
