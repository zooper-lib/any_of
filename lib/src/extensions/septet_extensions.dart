import 'package:any_of/any_of.dart';

extension SeptetExtensions<T0, T1, T2, T3, T4, T5, T6> on Septet<T0, T1, T2, T3, T4, T5, T6> {
  /// Maps the current instance of [Septet<T0, T1, T2, T3, T4, T5, T6>] to a different type [R].
  ///
  /// This method applies one of the provided functions based on the type of value stored in the [Septet].
  /// It checks each possible position (first to seventh) and applies the corresponding function if both
  /// a value is present at that position and the corresponding function is provided.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///   - [third]: A function that takes a [T2] type value and returns an [R] type value.
  ///   - [fourth]: A function that takes a [T3] type value and returns an [R] type value.
  ///   - [fifth]: A function that takes a [T4] type value and returns an [R] type value.
  ///   - [sixth]: A function that takes a [T5] type value and returns an [R] type value.
  ///   - [seventh]: A function that takes a [T6] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Septet]'s value.
  ///
  /// - Throws: An [Exception] if the [Septet] is empty or if none of the provided functions can be applied.
  R map<R>({
    required R Function(T0)? first,
    required R Function(T1)? second,
    required R Function(T2)? third,
    required R Function(T3)? fourth,
    required R Function(T4)? fifth,
    required R Function(T5)? sixth,
    required R Function(T6)? seventh,
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
    } else if (isSeventh && seventh != null) {
      return seventh(this.seventh);
    } else {
      throw Exception('Septet is empty');
    }
  }

  /// Executes a callback based on the type of value stored in the [Septet<T0, T1, T2, T3, T4, T5, T6>].
  ///
  /// This method checks each possible position (first to seventh) and executes the corresponding callback
  /// if a value is present at that position and the corresponding callback is provided.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///   - [third]: A callback function for the [T2] type value.
  ///   - [fourth]: A callback function for the [T3] type value.
  ///   - [fifth]: A callback function for the [T4] type value.
  ///   - [sixth]: A callback function for the [T5] type value.
  ///   - [seventh]: A callback function for the [T6] type value.
  ///
  /// - Throws: An [Exception] if the [Septet] is empty or if none of the provided callbacks can be executed.
  Future<void> on<R>({
    Future<void> Function(T0)? first,
    Future<void> Function(T1)? second,
    Future<void> Function(T2)? third,
    Future<void> Function(T3)? fourth,
    Future<void> Function(T4)? fifth,
    Future<void> Function(T5)? sixth,
    Future<void> Function(T6)? seventh,
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
    } else if (isSeventh) {
      return await seventh?.call(this.seventh);
    } else {
      throw Exception('Septet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Septet<T0, T1, T2, T3, T4, T5, T6>] is of the specified type [R].
  ///
  /// This method checks each possible position (first to seventh) and executes the [callback]
  /// with the value if a value of type [R] is present at that position.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Septet] does not contain a value of type [R], the [callback] is not executed.
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
    } else if (isSeventh && seventh is R) {
      callback(seventh as R);
    }
  }
}
