// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultUsecase<Success, Fail> {
  Object? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Success data) ok,
    required TResult Function(Fail data) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Success data)? ok,
    TResult? Function(Fail data)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Success data)? ok,
    TResult Function(Fail data)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Success, Fail> value) ok,
    required TResult Function(Err<Success, Fail> value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Ok<Success, Fail> value)? ok,
    TResult? Function(Err<Success, Fail> value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Success, Fail> value)? ok,
    TResult Function(Err<Success, Fail> value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultUsecaseCopyWith<Success, Fail, $Res> {
  factory $ResultUsecaseCopyWith(ResultUsecase<Success, Fail> value,
          $Res Function(ResultUsecase<Success, Fail>) then) =
      _$ResultUsecaseCopyWithImpl<Success, Fail, $Res,
          ResultUsecase<Success, Fail>>;
}

/// @nodoc
class _$ResultUsecaseCopyWithImpl<Success, Fail, $Res,
        $Val extends ResultUsecase<Success, Fail>>
    implements $ResultUsecaseCopyWith<Success, Fail, $Res> {
  _$ResultUsecaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OkCopyWith<Success, Fail, $Res> {
  factory _$$OkCopyWith(
          _$Ok<Success, Fail> value, $Res Function(_$Ok<Success, Fail>) then) =
      __$$OkCopyWithImpl<Success, Fail, $Res>;
  @useResult
  $Res call({Success data});
}

/// @nodoc
class __$$OkCopyWithImpl<Success, Fail, $Res>
    extends _$ResultUsecaseCopyWithImpl<Success, Fail, $Res,
        _$Ok<Success, Fail>> implements _$$OkCopyWith<Success, Fail, $Res> {
  __$$OkCopyWithImpl(
      _$Ok<Success, Fail> _value, $Res Function(_$Ok<Success, Fail>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Ok<Success, Fail>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Success,
    ));
  }
}

/// @nodoc

class _$Ok<Success, Fail> implements Ok<Success, Fail> {
  const _$Ok(this.data);

  @override
  final Success data;

  @override
  String toString() {
    return 'ResultUsecase<$Success, $Fail>.ok(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ok<Success, Fail> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OkCopyWith<Success, Fail, _$Ok<Success, Fail>> get copyWith =>
      __$$OkCopyWithImpl<Success, Fail, _$Ok<Success, Fail>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Success data) ok,
    required TResult Function(Fail data) err,
  }) {
    return ok(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Success data)? ok,
    TResult? Function(Fail data)? err,
  }) {
    return ok?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Success data)? ok,
    TResult Function(Fail data)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Success, Fail> value) ok,
    required TResult Function(Err<Success, Fail> value) err,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Ok<Success, Fail> value)? ok,
    TResult? Function(Err<Success, Fail> value)? err,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Success, Fail> value)? ok,
    TResult Function(Err<Success, Fail> value)? err,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<Success, Fail> implements ResultUsecase<Success, Fail> {
  const factory Ok(final Success data) = _$Ok<Success, Fail>;

  @override
  Success get data;
  @JsonKey(ignore: true)
  _$$OkCopyWith<Success, Fail, _$Ok<Success, Fail>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrCopyWith<Success, Fail, $Res> {
  factory _$$ErrCopyWith(_$Err<Success, Fail> value,
          $Res Function(_$Err<Success, Fail>) then) =
      __$$ErrCopyWithImpl<Success, Fail, $Res>;
  @useResult
  $Res call({Fail data});
}

/// @nodoc
class __$$ErrCopyWithImpl<Success, Fail, $Res>
    extends _$ResultUsecaseCopyWithImpl<Success, Fail, $Res,
        _$Err<Success, Fail>> implements _$$ErrCopyWith<Success, Fail, $Res> {
  __$$ErrCopyWithImpl(
      _$Err<Success, Fail> _value, $Res Function(_$Err<Success, Fail>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Err<Success, Fail>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Fail,
    ));
  }
}

/// @nodoc

class _$Err<Success, Fail> implements Err<Success, Fail> {
  const _$Err(this.data);

  @override
  final Fail data;

  @override
  String toString() {
    return 'ResultUsecase<$Success, $Fail>.err(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Err<Success, Fail> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrCopyWith<Success, Fail, _$Err<Success, Fail>> get copyWith =>
      __$$ErrCopyWithImpl<Success, Fail, _$Err<Success, Fail>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Success data) ok,
    required TResult Function(Fail data) err,
  }) {
    return err(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Success data)? ok,
    TResult? Function(Fail data)? err,
  }) {
    return err?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Success data)? ok,
    TResult Function(Fail data)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Ok<Success, Fail> value) ok,
    required TResult Function(Err<Success, Fail> value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Ok<Success, Fail> value)? ok,
    TResult? Function(Err<Success, Fail> value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Ok<Success, Fail> value)? ok,
    TResult Function(Err<Success, Fail> value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class Err<Success, Fail> implements ResultUsecase<Success, Fail> {
  const factory Err(final Fail data) = _$Err<Success, Fail>;

  @override
  Fail get data;
  @JsonKey(ignore: true)
  _$$ErrCopyWith<Success, Fail, _$Err<Success, Fail>> get copyWith =>
      throw _privateConstructorUsedError;
}
