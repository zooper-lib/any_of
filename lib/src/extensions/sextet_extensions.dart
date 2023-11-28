import 'package:any_of/any_of.dart';

extension SextetExtensions<T0, T1, T2, T3, T4, T5> on Sextet<T0, T1, T2, T3, T4, T5> {
  /// Maps the current instance of [Sextet<T0, T1, T2, T3, T4, T5>] to a different type [R].
  ///
  /// This method applies either the [first], [second], [third], [fourth], [fifth], or [sixth] function
  /// based on whether the [Sextet] holds a value of type [T0], [T1], [T2], [T3], [T4], or [T5], respectively.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///   - [third]: A function that takes a [T2] type value and returns an [R] type value.
  ///   - [fourth]: A function that takes a [T3] type value and returns an [R] type value.
  ///   - [fifth]: A function that takes a [T4] type value and returns an [R] type value.
  ///   - [sixth]: A function that takes a [T5] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Sextet]'s value.
  ///
  /// - Throws: An [Exception] if the [Sextet] is empty (neither [first], [second], [third], [fourth], [fifth], nor [sixth] value is present).
  R map<R>({
    required R Function(T0)? first,
    required R Function(T1)? second,
    required R Function(T2)? third,
    required R Function(T3)? fourth,
    required R Function(T4)? fifth,
    required R Function(T5)? sixth,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else if (isThird && third != null) {
      return third(this.third);
    } else if (isFourth && fourth != null) {
      return fourth(this.fourth);
    } else if (isFifth && fifth != null) {
      return fifth(this.fifth);
    } else if (isSixth && sixth != null) {
      return sixth(this.sixth);
    } else {
      throw Exception('Sextet is empty or functions are null');
    }
  }

  /// Executes a callback based on the type of value stored in the [Sextet<T0, T1, T2, T3, T4, T5>].
  ///
  /// If the [Sextet] contains a [T0] type value, the [first] callback is executed.
  /// If it contains a [T1] type value, the [second] callback is executed.
  /// If it contains a [T2] type value, the [third] callback is executed.
  /// If it contains a [T3] type value, the [fourth] callback is executed.
  /// If it contains a [T4] type value, the [fifth] callback is executed.
  /// If it contains a [T5] type value, the [sixth] callback is executed.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///   - [third]: A callback function for the [T2] type value.
  ///   - [fourth]: A callback function for the [T3] type value.
  ///   - [fifth]: A callback function for the [T4] type value.
  ///   - [sixth]: A callback function for the [T5] type value.
  ///
  /// - Throws: An [Exception] if the [Sextet] is empty (neither [first], [second], [third], [fourth], [fifth], nor [sixth] value is present).
  Future<void> on<R>({
    Future<void> Function(T0)? first,
    Future<void> Function(T1)? second,
    Future<void> Function(T2)? third,
    Future<void> Function(T3)? fourth,
    Future<void> Function(T4)? fifth,
    Future<void> Function(T5)? sixth,
  }) async {
    if (isFirst) {
      return await first?.call(this.first);
    } else if (isSecond) {
      return await second?.call(this.second);
    } else if (isThird) {
      return await third?.call(this.third);
    } else if (isFourth) {
      return await fourth?.call(this.fourth);
    } else if (isFifth) {
      return await fifth?.call(this.fifth);
    } else if (isSixth) {
      return await sixth?.call(this.sixth);
    } else {
      throw Exception('Sextet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Sextet<T0, T1, T2, T3, T4, T5>] is of the specified type [R].
  ///
  /// The method checks if the [Sextet] contains a value of type [R] in either its [first], [second], [third], [fourth], [fifth], or [sixth] position
  /// and executes the [callback] with that value.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Sextet] does not contain a value of type [R], the [callback] is not executed.
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
    } else if (isFifth && fifth is R) {
      callback(fifth as R);
    } else if (isSixth && sixth is R) {
      callback(sixth as R);
    }
  }
}
