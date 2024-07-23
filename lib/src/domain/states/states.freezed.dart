// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResourceState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(String? code, String? message, T data) success,
    required TResult Function(
            String? code, String? message, String? stacktrace, T? data)
        error,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(String? code, String? message, T data)? success,
    TResult? Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(String? code, String? message, T data)? success,
    TResult Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
    required TResult Function(ResourceInitial<T> value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
    TResult? Function(ResourceInitial<T> value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    TResult Function(ResourceInitial<T> value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceStateCopyWith<T, $Res> {
  factory $ResourceStateCopyWith(
          ResourceState<T> value, $Res Function(ResourceState<T>) then) =
      _$ResourceStateCopyWithImpl<T, $Res, ResourceState<T>>;
}

/// @nodoc
class _$ResourceStateCopyWithImpl<T, $Res, $Val extends ResourceState<T>>
    implements $ResourceStateCopyWith<T, $Res> {
  _$ResourceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResourceLoadingImplCopyWith<T, $Res> {
  factory _$$ResourceLoadingImplCopyWith(_$ResourceLoadingImpl<T> value,
          $Res Function(_$ResourceLoadingImpl<T>) then) =
      __$$ResourceLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResourceLoadingImplCopyWithImpl<T, $Res>
    extends _$ResourceStateCopyWithImpl<T, $Res, _$ResourceLoadingImpl<T>>
    implements _$$ResourceLoadingImplCopyWith<T, $Res> {
  __$$ResourceLoadingImplCopyWithImpl(_$ResourceLoadingImpl<T> _value,
      $Res Function(_$ResourceLoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResourceLoadingImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResourceLoadingImpl<T> implements ResourceLoading<T> {
  const _$ResourceLoadingImpl([this.data]);

  @override
  final T? data;

  @override
  String toString() {
    return 'ResourceState<$T>.loading(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceLoadingImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceLoadingImplCopyWith<T, _$ResourceLoadingImpl<T>> get copyWith =>
      __$$ResourceLoadingImplCopyWithImpl<T, _$ResourceLoadingImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(String? code, String? message, T data) success,
    required TResult Function(
            String? code, String? message, String? stacktrace, T? data)
        error,
    required TResult Function() initial,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(String? code, String? message, T data)? success,
    TResult? Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult? Function()? initial,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(String? code, String? message, T data)? success,
    TResult Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
    required TResult Function(ResourceInitial<T> value) initial,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
    TResult? Function(ResourceInitial<T> value)? initial,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    TResult Function(ResourceInitial<T> value)? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResourceLoading<T> implements ResourceState<T> {
  const factory ResourceLoading([final T? data]) = _$ResourceLoadingImpl<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$ResourceLoadingImplCopyWith<T, _$ResourceLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceSuccessImplCopyWith<T, $Res> {
  factory _$$ResourceSuccessImplCopyWith(_$ResourceSuccessImpl<T> value,
          $Res Function(_$ResourceSuccessImpl<T>) then) =
      __$$ResourceSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? code, String? message, T data});
}

/// @nodoc
class __$$ResourceSuccessImplCopyWithImpl<T, $Res>
    extends _$ResourceStateCopyWithImpl<T, $Res, _$ResourceSuccessImpl<T>>
    implements _$$ResourceSuccessImplCopyWith<T, $Res> {
  __$$ResourceSuccessImplCopyWithImpl(_$ResourceSuccessImpl<T> _value,
      $Res Function(_$ResourceSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResourceSuccessImpl<T>(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResourceSuccessImpl<T> implements ResourceSuccess<T> {
  const _$ResourceSuccessImpl({this.code, this.message, required this.data});

  @override
  final String? code;
  @override
  final String? message;
  @override
  final T data;

  @override
  String toString() {
    return 'ResourceState<$T>.success(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceSuccessImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceSuccessImplCopyWith<T, _$ResourceSuccessImpl<T>> get copyWith =>
      __$$ResourceSuccessImplCopyWithImpl<T, _$ResourceSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(String? code, String? message, T data) success,
    required TResult Function(
            String? code, String? message, String? stacktrace, T? data)
        error,
    required TResult Function() initial,
  }) {
    return success(code, message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(String? code, String? message, T data)? success,
    TResult? Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult? Function()? initial,
  }) {
    return success?.call(code, message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(String? code, String? message, T data)? success,
    TResult Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(code, message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
    required TResult Function(ResourceInitial<T> value) initial,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
    TResult? Function(ResourceInitial<T> value)? initial,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    TResult Function(ResourceInitial<T> value)? initial,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResourceSuccess<T> implements ResourceState<T> {
  const factory ResourceSuccess(
      {final String? code,
      final String? message,
      required final T data}) = _$ResourceSuccessImpl<T>;

  String? get code;
  String? get message;
  T get data;
  @JsonKey(ignore: true)
  _$$ResourceSuccessImplCopyWith<T, _$ResourceSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceErrorImplCopyWith<T, $Res> {
  factory _$$ResourceErrorImplCopyWith(_$ResourceErrorImpl<T> value,
          $Res Function(_$ResourceErrorImpl<T>) then) =
      __$$ResourceErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? code, String? message, String? stacktrace, T? data});
}

/// @nodoc
class __$$ResourceErrorImplCopyWithImpl<T, $Res>
    extends _$ResourceStateCopyWithImpl<T, $Res, _$ResourceErrorImpl<T>>
    implements _$$ResourceErrorImplCopyWith<T, $Res> {
  __$$ResourceErrorImplCopyWithImpl(_$ResourceErrorImpl<T> _value,
      $Res Function(_$ResourceErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? stacktrace = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResourceErrorImpl<T>(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      stacktrace: freezed == stacktrace
          ? _value.stacktrace
          : stacktrace // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResourceErrorImpl<T> implements ResourceError<T> {
  const _$ResourceErrorImpl(
      {this.code, this.message, this.stacktrace, this.data});

  @override
  final String? code;
  @override
  final String? message;
  @override
  final String? stacktrace;
  @override
  final T? data;

  @override
  String toString() {
    return 'ResourceState<$T>.error(code: $code, message: $message, stacktrace: $stacktrace, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceErrorImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stacktrace, stacktrace) ||
                other.stacktrace == stacktrace) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, stacktrace,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceErrorImplCopyWith<T, _$ResourceErrorImpl<T>> get copyWith =>
      __$$ResourceErrorImplCopyWithImpl<T, _$ResourceErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(String? code, String? message, T data) success,
    required TResult Function(
            String? code, String? message, String? stacktrace, T? data)
        error,
    required TResult Function() initial,
  }) {
    return error(code, message, stacktrace, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(String? code, String? message, T data)? success,
    TResult? Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult? Function()? initial,
  }) {
    return error?.call(code, message, stacktrace, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(String? code, String? message, T data)? success,
    TResult Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(code, message, stacktrace, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
    required TResult Function(ResourceInitial<T> value) initial,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
    TResult? Function(ResourceInitial<T> value)? initial,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    TResult Function(ResourceInitial<T> value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResourceError<T> implements ResourceState<T> {
  const factory ResourceError(
      {final String? code,
      final String? message,
      final String? stacktrace,
      final T? data}) = _$ResourceErrorImpl<T>;

  String? get code;
  String? get message;
  String? get stacktrace;
  T? get data;
  @JsonKey(ignore: true)
  _$$ResourceErrorImplCopyWith<T, _$ResourceErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceInitialImplCopyWith<T, $Res> {
  factory _$$ResourceInitialImplCopyWith(_$ResourceInitialImpl<T> value,
          $Res Function(_$ResourceInitialImpl<T>) then) =
      __$$ResourceInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResourceInitialImplCopyWithImpl<T, $Res>
    extends _$ResourceStateCopyWithImpl<T, $Res, _$ResourceInitialImpl<T>>
    implements _$$ResourceInitialImplCopyWith<T, $Res> {
  __$$ResourceInitialImplCopyWithImpl(_$ResourceInitialImpl<T> _value,
      $Res Function(_$ResourceInitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResourceInitialImpl<T> implements ResourceInitial<T> {
  const _$ResourceInitialImpl();

  @override
  String toString() {
    return 'ResourceState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResourceInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(String? code, String? message, T data) success,
    required TResult Function(
            String? code, String? message, String? stacktrace, T? data)
        error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(String? code, String? message, T data)? success,
    TResult? Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(String? code, String? message, T data)? success,
    TResult Function(
            String? code, String? message, String? stacktrace, T? data)?
        error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
    required TResult Function(ResourceInitial<T> value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
    TResult? Function(ResourceInitial<T> value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    TResult Function(ResourceInitial<T> value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResourceInitial<T> implements ResourceState<T> {
  const factory ResourceInitial() = _$ResourceInitialImpl<T>;
}
