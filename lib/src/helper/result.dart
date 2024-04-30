import 'package:equatable/equatable.dart';

/// This abstraction contains either a success data of generic type `S` or a
/// failure error of type `Failure` as its result.
///
/// `data` property must only be retrieved when `Result` was constructed by
/// using `Result.success(value)`. It can be validated by calling
/// `isSuccess` first. Alternatively, `dataOrElse` can be used instead since it
/// ensures a valid value is returned in case the result is a failure.
///
/// `error` must only be retrieved when `Result` was constructed by using
/// `Result.failure(error)`. It can be validated by calling `isFailure`
/// first.
abstract class Result<S> extends Equatable {
  static Result<S> failure<S>(String message) => _FailureResult(message);

  static Result<S> success<S>(S data) => _SuccessResult(data);

  static Result<S> unauthorized<S>(bool isUnauthenticated) =>
      _UnauthorizedResult(isUnauthenticated);

  /// Get [error] value, returns null when the value is actually [data]
  String? get error => fold<String?>(
          (error) => error, (data) => null, (isUnauthenticated) => null);

  /// Get [data] value, returns null when the value is actually [error]
  S? get data =>
      fold<S?>((error) => null, (data) => data, (isUnauthenticated) => null);

  /// Get [error] value, returns null when the value is actually [data]
  bool? get isUnauthenticated => fold<bool?>((error) => null, (data) => null,
          (isUnauthenticated) => isUnauthenticated);

  /// Returns `true` if the object is of the `SuccessResult` type, which means
  /// `data` will return a valid result.
  bool get isSuccess => this is _SuccessResult<S>;

  /// Returns `true` if the object is of the `FailureResult` type, which means
  /// `error` will return a valid result.
  bool get isFailure => this is _FailureResult<S>;

  /// Returns `true` if the object is of the `FailureResult` type, which means
  /// `error` will return a valid result.
  bool get isUnauthorized => this is _UnauthorizedResult<S>;

  /// Returns `data` if `isSuccess` returns `true`, otherwise it returns
  /// `other`.
  S dataOrElse(S other) => isSuccess && data != null ? data! : other;

  /// Sugar syntax that calls `dataOrElse` under the hood. Returns left value if
  /// `isSuccess` returns `true`, otherwise it returns the right value.
  S operator |(S other) => dataOrElse(other);

  /// Transforms values of [error] and [data] in new a `Result` type. Only
  /// the matching function to the object type will be executed. For example,
  /// for a `SuccessResult` object only the [fnData] function will be executed.
  Result<T> either<T>(
      String Function(String error) fnFailure,
      T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized);

  /// Transforms value of [data] allowing a new `Result` to be returned.
  /// A `SuccessResult` might return a `FailureResult` and vice versa.
  Result<T> then<T>(Result<T> Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized);

  /// Transforms value of [data] always keeping the original identity of the
  /// `Result`, meaning that a `SuccessResult` returns a `SuccessResult` and
  /// a `FailureResult` always returns a `FailureResult`.
  Result<T> map<T>(T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized);

  /// Folds [error] and [data] into the value of one type. Only the matching
  /// function to the object type will be executed. For example, for a
  /// `SuccessResult` object only the [fnData] function will be executed.
  T fold<T>(T Function(String error) fnFailure, T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized);

  @override
  List<Object?> get props => [if (isSuccess) data else error];
}

/// Success implementation of `Result`. It contains `data`. It's abstracted
/// away by `Result`. It shouldn't be used directly in the app.
class _SuccessResult<S> extends Result<S> {
  final S _value;

  _SuccessResult(this._value);

  @override
  _SuccessResult<T> either<T>(
      String Function(String error) fnFailure,
      T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  Result<T> then<T>(Result<T> Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return fnData(_value);
  }

  @override
  _SuccessResult<T> map<T>(T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  T fold<T>(T Function(String error) fnFailure, T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return fnData(_value);
  }
}

/// Failure implementation of `Result`. It contains `error`.  It's
/// abstracted away by `Result`. It shouldn't be used directly in the app.
class _FailureResult<S> extends Result<S> {
  final String _value;

  _FailureResult(this._value);

  @override
  _FailureResult<T> either<T>(
      String Function(String error) fnFailure,
      T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _FailureResult<T>(fnFailure(_value));
  }

  @override
  _FailureResult<T> map<T>(T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _FailureResult<T>(_value);
  }

  @override
  _FailureResult<T> then<T>(Result<T> Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _FailureResult<T>(_value);
  }

  @override
  T fold<T>(T Function(String error) fnFailure, T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return fnFailure(_value);
  }
}

/// Unauthorized implementation of `Result`. It contains `unauthorized`.  It's
/// abstracted away by `Result`. It shouldn't be used directly in the app.
class _UnauthorizedResult<S> extends Result<S> {
  final bool _value;

  _UnauthorizedResult(this._value);

  @override
  _UnauthorizedResult<T> either<T>(
      String Function(String error) fnFailure,
      T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _UnauthorizedResult<T>(_value);
  }

  @override
  _UnauthorizedResult<T> map<T>(T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _UnauthorizedResult<T>(_value);
  }

  @override
  _UnauthorizedResult<T> then<T>(Result<T> Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return _UnauthorizedResult<T>(_value);
  }

  @override
  T fold<T>(T Function(String error) fnFailure, T Function(S data) fnData,
      T Function(bool isUnauthenticated) fnUnauthorized) {
    return fnUnauthorized(_value);
  }
}
