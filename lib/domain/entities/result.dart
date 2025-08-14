/// Utility class that simplifies handling errors.
///
/// Return a [Result] from a function to indicate success or failure.
///
/// A [Result] is either an [Ok] with a value of type [T]
/// or an [Failure] with an [Exception].
///
/// Use [Result.ok] to create a successful result with a value of type [T].
/// Use [Result.error] to create an error result with an [Exception].
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Failure(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Exception error) = Failure._;

  bool get isSuccess => this is Ok<T>;

  bool get isError => this is Failure<T>;

  T? get resultValue => switch (this) {
    Ok(value: final v) => v,
    _ => null,
  };

  Exception? get error => switch (this) {
    Failure(error: final e) => e,
    _ => null,
  };
}

/// A successful [Result] with a returned [value].
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// The returned value of this result.
  final T value;

  @override
  String toString() => "Result<$T>.ok($value)";
}

/// An error [Result] with a resulting [error].
final class Failure<T> extends Result<T> {
  const Failure._(this.exception);

  /// The resulting error of this result.
  final Exception exception;

  @override
  String toString() => "Result<$T>.error($exception)";
}
