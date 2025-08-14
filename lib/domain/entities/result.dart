sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Success._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(String error) = Failure._;

  bool get isSuccess => this is Success<T>;

  bool get isError => this is Failure<T>;

  T? get value => switch (this) {
    Success(val: final v) => v,
    _ => null,
  };

  String? get error => switch (this) {
    Failure(err: final e) => e,
    _ => null,
  };
}

/// A successful [Result] with a returned [value].
final class Success<T> extends Result<T> {
  const Success._(this.val);

  /// The returned value of this result.
  final T val;

  @override
  String toString() => "Result<$T>.success($val)";
}

/// An error [Result] with a resulting [error].
final class Failure<T> extends Result<T> {
  const Failure._(this.err);

  /// The resulting error of this result.
  final String err;

  @override
  String toString() => "Result<$T>.error($err)";
}
