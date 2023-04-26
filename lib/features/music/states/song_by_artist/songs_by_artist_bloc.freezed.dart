// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_by_artist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongsByArtistEvent {
  String get artistName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String artistName) loadSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String artistName)? loadSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String artistName)? loadSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSongs value) loadSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSongs value)? loadSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSongs value)? loadSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongsByArtistEventCopyWith<SongsByArtistEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsByArtistEventCopyWith<$Res> {
  factory $SongsByArtistEventCopyWith(
          SongsByArtistEvent value, $Res Function(SongsByArtistEvent) then) =
      _$SongsByArtistEventCopyWithImpl<$Res, SongsByArtistEvent>;
  @useResult
  $Res call({String artistName});
}

/// @nodoc
class _$SongsByArtistEventCopyWithImpl<$Res, $Val extends SongsByArtistEvent>
    implements $SongsByArtistEventCopyWith<$Res> {
  _$SongsByArtistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
  }) {
    return _then(_value.copyWith(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadSongsCopyWith<$Res>
    implements $SongsByArtistEventCopyWith<$Res> {
  factory _$$_LoadSongsCopyWith(
          _$_LoadSongs value, $Res Function(_$_LoadSongs) then) =
      __$$_LoadSongsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String artistName});
}

/// @nodoc
class __$$_LoadSongsCopyWithImpl<$Res>
    extends _$SongsByArtistEventCopyWithImpl<$Res, _$_LoadSongs>
    implements _$$_LoadSongsCopyWith<$Res> {
  __$$_LoadSongsCopyWithImpl(
      _$_LoadSongs _value, $Res Function(_$_LoadSongs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
  }) {
    return _then(_$_LoadSongs(
      null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadSongs implements _LoadSongs {
  const _$_LoadSongs(this.artistName);

  @override
  final String artistName;

  @override
  String toString() {
    return 'SongsByArtistEvent.loadSongs(artistName: $artistName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSongs &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, artistName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSongsCopyWith<_$_LoadSongs> get copyWith =>
      __$$_LoadSongsCopyWithImpl<_$_LoadSongs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String artistName) loadSongs,
  }) {
    return loadSongs(artistName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String artistName)? loadSongs,
  }) {
    return loadSongs?.call(artistName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String artistName)? loadSongs,
    required TResult orElse(),
  }) {
    if (loadSongs != null) {
      return loadSongs(artistName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSongs value) loadSongs,
  }) {
    return loadSongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSongs value)? loadSongs,
  }) {
    return loadSongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSongs value)? loadSongs,
    required TResult orElse(),
  }) {
    if (loadSongs != null) {
      return loadSongs(this);
    }
    return orElse();
  }
}

abstract class _LoadSongs implements SongsByArtistEvent {
  const factory _LoadSongs(final String artistName) = _$_LoadSongs;

  @override
  String get artistName;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSongsCopyWith<_$_LoadSongs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SongsByArtistState {
  List<MusicModel> get songs => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel> songs) loading,
    required TResult Function(List<MusicModel> songs) loaded,
    required TResult Function(String error, List<MusicModel> songs) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel> songs)? loading,
    TResult? Function(List<MusicModel> songs)? loaded,
    TResult? Function(String error, List<MusicModel> songs)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel> songs)? loading,
    TResult Function(List<MusicModel> songs)? loaded,
    TResult Function(String error, List<MusicModel> songs)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongsByArtistStateCopyWith<SongsByArtistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongsByArtistStateCopyWith<$Res> {
  factory $SongsByArtistStateCopyWith(
          SongsByArtistState value, $Res Function(SongsByArtistState) then) =
      _$SongsByArtistStateCopyWithImpl<$Res, SongsByArtistState>;
  @useResult
  $Res call({List<MusicModel> songs});
}

/// @nodoc
class _$SongsByArtistStateCopyWithImpl<$Res, $Val extends SongsByArtistState>
    implements $SongsByArtistStateCopyWith<$Res> {
  _$SongsByArtistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_value.copyWith(
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $SongsByArtistStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicModel> songs});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$SongsByArtistStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$_Loading(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(final List<MusicModel> songs) : _songs = songs;

  final List<MusicModel> _songs;
  @override
  List<MusicModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SongsByArtistState.loading(songs: $songs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel> songs) loading,
    required TResult Function(List<MusicModel> songs) loaded,
    required TResult Function(String error, List<MusicModel> songs) error,
  }) {
    return loading(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel> songs)? loading,
    TResult? Function(List<MusicModel> songs)? loaded,
    TResult? Function(String error, List<MusicModel> songs)? error,
  }) {
    return loading?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel> songs)? loading,
    TResult Function(List<MusicModel> songs)? loaded,
    TResult Function(String error, List<MusicModel> songs)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SongsByArtistState {
  const factory _Loading(final List<MusicModel> songs) = _$_Loading;

  @override
  List<MusicModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $SongsByArtistStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicModel> songs});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$SongsByArtistStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$_Loaded(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(final List<MusicModel> songs) : _songs = songs;

  final List<MusicModel> _songs;
  @override
  List<MusicModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SongsByArtistState.loaded(songs: $songs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel> songs) loading,
    required TResult Function(List<MusicModel> songs) loaded,
    required TResult Function(String error, List<MusicModel> songs) error,
  }) {
    return loaded(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel> songs)? loading,
    TResult? Function(List<MusicModel> songs)? loaded,
    TResult? Function(String error, List<MusicModel> songs)? error,
  }) {
    return loaded?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel> songs)? loading,
    TResult Function(List<MusicModel> songs)? loaded,
    TResult Function(String error, List<MusicModel> songs)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SongsByArtistState {
  const factory _Loaded(final List<MusicModel> songs) = _$_Loaded;

  @override
  List<MusicModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $SongsByArtistStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, List<MusicModel> songs});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$SongsByArtistStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? songs = null,
  }) {
    return _then(_$_Error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error, final List<MusicModel> songs) : _songs = songs;

  @override
  final String error;
  final List<MusicModel> _songs;
  @override
  List<MusicModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'SongsByArtistState.error(error: $error, songs: $songs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, error, const DeepCollectionEquality().hash(_songs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel> songs) loading,
    required TResult Function(List<MusicModel> songs) loaded,
    required TResult Function(String error, List<MusicModel> songs) error,
  }) {
    return error(this.error, songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel> songs)? loading,
    TResult? Function(List<MusicModel> songs)? loaded,
    TResult? Function(String error, List<MusicModel> songs)? error,
  }) {
    return error?.call(this.error, songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel> songs)? loading,
    TResult Function(List<MusicModel> songs)? loaded,
    TResult Function(String error, List<MusicModel> songs)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SongsByArtistState {
  const factory _Error(final String error, final List<MusicModel> songs) =
      _$_Error;

  String get error;
  @override
  List<MusicModel> get songs;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
