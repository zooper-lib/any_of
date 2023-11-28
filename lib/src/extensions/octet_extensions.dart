import 'package:any_of/any_of.dart';

extension OctetExtensions<T0, T1, T2, T3, T4, T5, T6, T7> on Octet<T0, T1, T2, T3, T4, T5, T6, T7> {
  /// Maps the current instance of [Octet<T0, T1, T2, T3, T4, T5, T6, T7>] to a different type [R].
  ///
  /// This method applies one of the provided functions based on the type of value stored
  /// in the [Octet]. It checks each position for a non-null value and executes the corresponding
  /// function if it's non-null. If no non-null value is found, an [Exception] is thrown.
  ///
  /// - Parameters:
  ///   - [first]: A function that takes a [T0] type value and returns an [R] type value.
  ///   - [second]: A function that takes a [T1] type value and returns an [R] type value.
  ///   - [third]: A function that takes a [T2] type value and returns an [R] type value.
  ///   - [fourth]: A function that takes a [T3] type value and returns an [R] type value.
  ///   - [fifth]: A function that takes a [T4] type value and returns an [R] type value.
  ///   - [sixth]: A function that takes a [T5] type value and returns an [R] type value.
  ///   - [seventh]: A function that takes a [T6] type value and returns an [R] type value.
  ///   - [eighth]: A function that takes a [T7] type value and returns an [R] type value.
  ///
  /// - Returns: The result of applying the corresponding function to the [Octet]'s value.
  ///
  /// - Throws: An [Exception] if all functions are null or if there is no non-null value in the [Octet].
  R map<R>({
    required R Function(T0)? first,
    required R Function(T1)? second,
    required R Function(T2)? third,
    required R Function(T3)? fourth,
    required R Function(T4)? fifth,
    required R Function(T5)? sixth,
    required R Function(T6)? seventh,
    required R Function(T7)? eighth,
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
    } else if (isEighth && eighth != null) {
      return eighth(this.eighth);
    } else {
      throw Exception('Octet is empty');
    }
  }

  /// Executes a callback based on the type of value stored in the [Octet<T0, T1, T2, T3, T4, T5, T6, T7>].
  ///
  /// If the [Octet] contains a [T0] type value, the [first] callback is executed.
  /// If it contains a [T1] type value, the [second] callback is executed.
  /// If it contains a [T2] type value, the [third] callback is executed.
  /// If it contains a [T3] type value, the [fourth] callback is executed.
  /// If it contains a [T4] type value, the [fifth] callback is executed.
  /// If it contains a [T5] type value, the [sixth] callback is executed.
  /// If it contains a [T6] type value, the [seventh] callback is executed.
  /// If it contains a [T7] type value, the [eighth] callback is executed.
  ///
  /// - Parameters:
  ///   - [first]: A callback function for the [T0] type value.
  ///   - [second]: A callback function for the [T1] type value.
  ///   - [third]: A callback function for the [T2] type value.
  ///   - [fourth]: A callback function for the [T3] type value.
  ///   - [fifth]: A callback function for the [T4] type value.
  ///   - [sixth]: A callback function for the [T5] type value.
  ///   - [seventh]: A callback function for the [T6] type value.
  ///   - [eighth]: A callback function for the [T7] type value.
  ///
  /// - Throws: An [Exception] if there is no non-null value in the [Octet].
  void on<R>({
    void Function(T0)? first,
    void Function(T1)? second,
    void Function(T2)? third,
    void Function(T3)? fourth,
    void Function(T4)? fifth,
    void Function(T5)? sixth,
    void Function(T6)? seventh,
    void Function(T7)? eighth,
  }) {
    if (isFirst) {
      return first?.call(this.first);
    } else if (isSecond) {
      return second?.call(this.second);
    } else if (isThird) {
      return third?.call(this.third);
    } else if (isFourth) {
      return fourth?.call(this.fourth);
    } else if (isFifth) {
      return fifth?.call(this.fifth);
    } else if (isSixth) {
      return sixth?.call(this.sixth);
    } else if (isSeventh) {
      return seventh?.call(this.seventh);
    } else if (isEighth) {
      return eighth?.call(this.eighth);
    } else {
      throw Exception('Octet is empty');
    }
  }

  /// Executes the provided callback if the current value in the [Octet<T0, T1, T2, T3, T4, T5, T6, T7>] is of the specified type [R].
  ///
  /// The method checks if the [Octet] contains a value of type [R] in any of its positions
  /// and executes the [callback] with that value.
  ///
  /// - Parameter [callback]: A function to be executed with the value of type [R].
  ///
  /// - Note: If the [Octet] does not contain a value of type [R], the [callback] is not executed.
  void ifType<R>({
    required void Function(T0) first,
    required void Function(T1) second,
    required void Function(T2) third,
    required void Function(T3) fourth,
    required void Function(T4) fifth,
    required void Function(T5) sixth,
    required void Function(T6) seventh,
    required void Function(T7) eighth,
  }) {
    if (isFirst) {
      return first(this.first);
    } else if (isSecond) {
      return second(this.second);
    } else if (isThird) {
      return third(this.third);
    } else if (isFourth) {
      return fourth(this.fourth);
    } else if (isFifth) {
      return fifth(this.fifth);
    } else if (isSixth) {
      return sixth(this.sixth);
    } else if (isSeventh) {
      return seventh(this.seventh);
    } else if (isEighth) {
      return eighth(this.eighth);
    }
  }
}
