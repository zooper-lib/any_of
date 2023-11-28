import 'package:any_of/any_of.dart';

extension DoubletExtensions<T0, T1> on Doublet<T0, T1> {
  /// Maps the current instance of [Doublet<T0, T1>] to a different type [R].
  ///
  /// This method applies either the [first] or [second] function
  /// based on whether the [Doublet] holds a value of type [T0] or [T1], respectively.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Doublet]'s value.
  ///
  /// - Throws: An [Exception] if the [Doublet] is empty (neither [first] nor [second] value is present).
  R map<R>({
    required R Function(T0)? first,
    required R Function(T1)? second,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else {
      throw Exception('Doublet is empty');
    }
  }

  /// Executes a callback based on the type of value stored in the [Doublet<T0, T1>].
  ///
  /// If the [Doublet] contains a [T0] type value, the [first] callback is executed.
  /// If it contains a [T1] type value, the [second] callback is executed.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///
  /// - Throws: An [Exception] if the [Doublet] is empty (neither [first] nor [second] value is present).
  Future<void> on<R>({
    Future<void> Function(T0)? first,
    Future<void> Function(T1)? second,
  }) async {
    if (isFirst) {
      return await first?.call(this.first);
    } else if (isSecond) {
      return await second?.call(this.second);
    } else {
      throw Exception('Doublet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Doublet<T0, T1>] is of the specified type [R].
  ///
  /// The method checks if the [Doublet] contains a value of type [R] in either its [first] or [second] position
  /// and executes the [callback] with that value.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Doublet] does not contain a value of type [R], the [callback] is not executed.
  void ifType<R>({
    required void Function(R) callback,
  }) {
    if (isFirst && first is R) {
      callback(first as R);
    } else if (isSecond && second is R) {
      callback(second as R);
    }
  }
}
