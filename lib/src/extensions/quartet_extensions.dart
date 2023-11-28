import 'package:any_of/any_of.dart';

extension QuartetExtensions<T0, T1, T2, T3> on Quartet<T0, T1, T2, T3> {
  /// Maps the current instance of [Quartet<T0, T1, T2, T3>] to a different type [R].
  ///
  /// This method applies either the [first], [second], [third], or [fourth] function
  /// based on whether the [Quartet] holds a value of type [T0], [T1], [T2], or [T3], respectively.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///   - [third]: A function that takes a [T2] type value and returns an [R] type value.
  ///   - [fourth]: A function that takes a [T3] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Quartet]'s value.
  ///
  /// - Throws: An [Exception] if the [Quartet] is empty (neither [first], [second], [third], nor [fourth] value is present).
  R? map<R>({
    R Function(T0)? first,
    R Function(T1)? second,
    R Function(T2)? third,
    R Function(T3)? fourth,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else if (isThird && third != null) {
      return third(this.third);
    } else if (isFourth && fourth != null) {
      return fourth(this.fourth);
    } else {
      throw Exception('Quartet is empty or functions are null');
    }
  }

  /// Executes a callback based on the type of value stored in the [Quartet<T0, T1, T2, T3>].
  ///
  /// If the [Quartet] contains a [T0] type value, the [first] callback is executed.
  /// If it contains a [T1] type value, the [second] callback is executed.
  /// If it contains a [T2] type value, the [third] callback is executed.
  /// If it contains a [T3] type value, the [fourth] callback is executed.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///   - [third]: A callback function for the [T2] type value.
  ///   - [fourth]: A callback function for the [T3] type value.
  ///
  /// - Throws: An [Exception] if the [Quartet] is empty (neither [first], [second], [third], nor [fourth] value is present).
  void on<R>({
    void Function(T0)? first,
    void Function(T1)? second,
    void Function(T2)? third,
    void Function(T3)? fourth,
  }) {
    if (isFirst) {
      return first?.call(this.first);
    } else if (isSecond) {
      return second?.call(this.second);
    } else if (isThird) {
      return third?.call(this.third);
    } else if (isFourth) {
      return fourth?.call(this.fourth);
    } else {
      throw Exception('Quartet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Quartet<T0, T1, T2, T3>] is of the specified type [R].
  ///
  /// The method checks if the [Quartet] contains a value of type [R] in either its [first], [second], [third], or [fourth] position
  /// and executes the [callback] with that value.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Quartet] does not contain a value of type [R], the [callback] is not executed.
  void ifType<R>({
    required void Function(R) callback,
  }) {
    if (isFirst && first is R) {
      callback(first as R);
    } else if (isSecond && second is R) {
      callback(second as R);
    } else if (isThird && third is R) {
      callback(third as R);
    } else if (isFourth && fourth is R) {
      callback(fourth as R);
    }
  }
}
