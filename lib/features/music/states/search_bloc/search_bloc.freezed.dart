// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) search,
    required TResult Function() clearSearchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? search,
    TResult Function()? clearSearchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearchResult value) clearSearchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearchResult value)? clearSearchResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearchResult value)? clearSearchResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
  }) {
    return _then(_$_Search(
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchEvent.search(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) search,
    required TResult Function() clearSearchResult,
  }) {
    return search(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearchResult,
  }) {
    return search?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? search,
    TResult Function()? clearSearchResult,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearchResult value) clearSearchResult,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearchResult value)? clearSearchResult,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearchResult value)? clearSearchResult,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchEvent {
  const factory _Search(final String keyword) = _$_Search;

  String get keyword;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearSearchResultCopyWith<$Res> {
  factory _$$_ClearSearchResultCopyWith(_$_ClearSearchResult value,
          $Res Function(_$_ClearSearchResult) then) =
      __$$_ClearSearchResultCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearSearchResultCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_ClearSearchResult>
    implements _$$_ClearSearchResultCopyWith<$Res> {
  __$$_ClearSearchResultCopyWithImpl(
      _$_ClearSearchResult _value, $Res Function(_$_ClearSearchResult) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearSearchResult implements _ClearSearchResult {
  const _$_ClearSearchResult();

  @override
  String toString() {
    return 'SearchEvent.clearSearchResult()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearSearchResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) search,
    required TResult Function() clearSearchResult,
  }) {
    return clearSearchResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String keyword)? search,
    TResult? Function()? clearSearchResult,
  }) {
    return clearSearchResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? search,
    TResult Function()? clearSearchResult,
    required TResult orElse(),
  }) {
    if (clearSearchResult != null) {
      return clearSearchResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ClearSearchResult value) clearSearchResult,
  }) {
    return clearSearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ClearSearchResult value)? clearSearchResult,
  }) {
    return clearSearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ClearSearchResult value)? clearSearchResult,
    required TResult orElse(),
  }) {
    if (clearSearchResult != null) {
      return clearSearchResult(this);
    }
    return orElse();
  }
}

abstract class _ClearSearchResult implements SearchEvent {
  const factory _ClearSearchResult() = _$_ClearSearchResult;
}

/// @nodoc
mixin _$SearchState {
  List<MusicModel>? get songs => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel>? songs, bool isLoading) loading,
    required TResult Function(List<MusicModel> songs, bool isLoading) loaded,
    required TResult Function(
            String error, List<MusicModel>? songs, bool isLoading)
        error,
    required TResult Function(
            List<MusicModel> songs, bool isLoading, bool isCleared)
        cleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult? Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult? Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult? Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Cleared value) cleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Cleared value)? cleared,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Cleared value)? cleared,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({List<MusicModel> songs, bool isLoading});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      songs: null == songs
          ? _value.songs!
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicModel>? songs, bool isLoading});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_Loading(
      songs: freezed == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({final List<MusicModel>? songs, this.isLoading = true})
      : _songs = songs;

  final List<MusicModel>? _songs;
  @override
  List<MusicModel>? get songs {
    final value = _songs;
    if (value == null) return null;
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SearchState.loading(songs: $songs, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songs), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel>? songs, bool isLoading) loading,
    required TResult Function(List<MusicModel> songs, bool isLoading) loaded,
    required TResult Function(
            String error, List<MusicModel>? songs, bool isLoading)
        error,
    required TResult Function(
            List<MusicModel> songs, bool isLoading, bool isCleared)
        cleared,
  }) {
    return loading(songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult? Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult? Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult? Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
  }) {
    return loading?.call(songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(songs, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Cleared value) cleared,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Cleared value)? cleared,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Cleared value)? cleared,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading(
      {final List<MusicModel>? songs, final bool isLoading}) = _$_Loading;

  @override
  List<MusicModel>? get songs;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicModel> songs, bool isLoading});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
    Object? isLoading = null,
  }) {
    return _then(_$_Loaded(
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<MusicModel> songs, this.isLoading = false})
      : _songs = songs;

  final List<MusicModel> _songs;
  @override
  List<MusicModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SearchState.loaded(songs: $songs, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songs), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel>? songs, bool isLoading) loading,
    required TResult Function(List<MusicModel> songs, bool isLoading) loaded,
    required TResult Function(
            String error, List<MusicModel>? songs, bool isLoading)
        error,
    required TResult Function(
            List<MusicModel> songs, bool isLoading, bool isCleared)
        cleared,
  }) {
    return loaded(songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult? Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult? Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult? Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
  }) {
    return loaded?.call(songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(songs, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Cleared value) cleared,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Cleared value)? cleared,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Cleared value)? cleared,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SearchState {
  const factory _Loaded(
      {required final List<MusicModel> songs,
      final bool isLoading}) = _$_Loaded;

  @override
  List<MusicModel> get songs;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, List<MusicModel>? songs, bool isLoading});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? songs = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_Error(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      songs: freezed == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required this.error,
      final List<MusicModel>? songs,
      this.isLoading = false})
      : _songs = songs;

  @override
  final String error;
  final List<MusicModel>? _songs;
  @override
  List<MusicModel>? get songs {
    final value = _songs;
    if (value == null) return null;
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SearchState.error(error: $error, songs: $songs, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error,
      const DeepCollectionEquality().hash(_songs), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel>? songs, bool isLoading) loading,
    required TResult Function(List<MusicModel> songs, bool isLoading) loaded,
    required TResult Function(
            String error, List<MusicModel>? songs, bool isLoading)
        error,
    required TResult Function(
            List<MusicModel> songs, bool isLoading, bool isCleared)
        cleared,
  }) {
    return error(this.error, songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult? Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult? Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult? Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
  }) {
    return error?.call(this.error, songs, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, songs, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Cleared value) cleared,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Cleared value)? cleared,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Cleared value)? cleared,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SearchState {
  const factory _Error(
      {required final String error,
      final List<MusicModel>? songs,
      final bool isLoading}) = _$_Error;

  String get error;
  @override
  List<MusicModel>? get songs;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$$_ClearedCopyWith(
          _$_Cleared value, $Res Function(_$_Cleared) then) =
      __$$_ClearedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicModel> songs, bool isLoading, bool isCleared});
}

/// @nodoc
class __$$_ClearedCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_Cleared>
    implements _$$_ClearedCopyWith<$Res> {
  __$$_ClearedCopyWithImpl(_$_Cleared _value, $Res Function(_$_Cleared) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
    Object? isLoading = null,
    Object? isCleared = null,
  }) {
    return _then(_$_Cleared(
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<MusicModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCleared: null == isCleared
          ? _value.isCleared
          : isCleared // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Cleared implements _Cleared {
  const _$_Cleared(
      {final List<MusicModel> songs = const <MusicModel>[],
      this.isLoading = false,
      this.isCleared = true})
      : _songs = songs;

  final List<MusicModel> _songs;
  @override
  @JsonKey()
  List<MusicModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCleared;

  @override
  String toString() {
    return 'SearchState.cleared(songs: $songs, isLoading: $isLoading, isCleared: $isCleared)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cleared &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCleared, isCleared) ||
                other.isCleared == isCleared));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_songs), isLoading, isCleared);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClearedCopyWith<_$_Cleared> get copyWith =>
      __$$_ClearedCopyWithImpl<_$_Cleared>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MusicModel>? songs, bool isLoading) loading,
    required TResult Function(List<MusicModel> songs, bool isLoading) loaded,
    required TResult Function(
            String error, List<MusicModel>? songs, bool isLoading)
        error,
    required TResult Function(
            List<MusicModel> songs, bool isLoading, bool isCleared)
        cleared,
  }) {
    return cleared(songs, isLoading, isCleared);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult? Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult? Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult? Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
  }) {
    return cleared?.call(songs, isLoading, isCleared);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MusicModel>? songs, bool isLoading)? loading,
    TResult Function(List<MusicModel> songs, bool isLoading)? loaded,
    TResult Function(String error, List<MusicModel>? songs, bool isLoading)?
        error,
    TResult Function(List<MusicModel> songs, bool isLoading, bool isCleared)?
        cleared,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared(songs, isLoading, isCleared);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
    required TResult Function(_Cleared value) cleared,
  }) {
    return cleared(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
    TResult? Function(_Cleared value)? cleared,
  }) {
    return cleared?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    TResult Function(_Cleared value)? cleared,
    required TResult orElse(),
  }) {
    if (cleared != null) {
      return cleared(this);
    }
    return orElse();
  }
}

abstract class _Cleared implements SearchState {
  const factory _Cleared(
      {final List<MusicModel> songs,
      final bool isLoading,
      final bool isCleared}) = _$_Cleared;

  @override
  List<MusicModel> get songs;
  @override
  bool get isLoading;
  bool get isCleared;
  @override
  @JsonKey(ignore: true)
  _$$_ClearedCopyWith<_$_Cleared> get copyWith =>
      throw _privateConstructorUsedError;
}
