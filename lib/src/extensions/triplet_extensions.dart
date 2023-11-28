import 'package:any_of/any_of.dart';

extension TripletExtensions<T0, T1, T2> on Triplet<T0, T1, T2> {
  /// Maps the current instance of [Triplet<T0, T1, T2>] to a different type [R].
  ///
  /// This method applies either the [first], [second], or [third] function
  /// based on whether the [Triplet] holds a value of type [T0], [T1], or [T2], respectively.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///   - [third]: A function that takes a [T2] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Triplet]'s value.
  ///
  /// - Throws: An [Exception] if the [Triplet] is empty (neither [first], [second], nor [third] value is present).
  R map<R>({
    R Function(T0)? first,
    R Function(T1)? second,
    R Function(T2)? third,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else if (isThird && third != null) {
      return third(this.third);
    } else {
      throw Exception('Triplet is empty or functions are null');
    }
  }

  /// Executes a callback based on the type of value stored in the [Triplet<T0, T1, T2>].
  ///
  /// If the [Triplet] contains a [T0] type value, the [first] callback is executed.
  /// If it contains a [T1] type value, the [second] callback is executed.
  /// If it contains a [T2] type value, the [third] callback is executed.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///   - [third]: A callback function for the [T2] type value.
  ///
  /// - Throws: An [Exception] if the [Triplet] is empty (neither [first], [second], nor [third] value is present).
  void on<R>({
    void Function(T0)? first,
    void Function(T1)? second,
    void Function(T2)? third,
  }) {
    if (isFirst) {
      return first?.call(this.first);
    } else if (isSecond) {
      return second?.call(this.second);
    } else if (isThird) {
      return third?.call(this.third);
    } else {
      throw Exception('Triplet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Triplet<T0, T1, T2>] is of the specified type [R].
  ///
  /// The method checks if the [Triplet] contains a value of type [R] in either its [first], [second], or [third] position
  /// and executes the [callback] with that value.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Triplet] does not contain a value of type [R], the [callback] is not executed.
  void ifType<R>({
    required void Function(R) callback,
  }) {
    if (isFirst && first is R) {
      callback(first as R);
    } else if (isSecond && second is R) {
      callback(second as R);
    } else if (isThird && third is R) {
      callback(third as R);
    }
  }
}
