import 'package:any_of/any_of.dart';

class OctetUtils {
  /// Executes a function that returns a [Future] of [Octet<T0, T1, T2, T3, T4, T5, T6, T7>] and applies callbacks based on the [Octet]'s value.
  ///
  /// This static method asynchronously executes [functionToExecute] and then uses the [on] method
  /// to execute the appropriate callback based on the value's type in the returned [Octet].
  ///
  /// - Parameters:
  ///   - [functionToExecute]: A function returning a [Future] of [Octet<T0, T1, T2, T3, T4, T5, T6, T7>].
  ///   - [onFirst]: An optional callback function for handling the [T0] type value.
  ///   - [onSecond]: An optional callback function for handling the [T1] type value.
  ///   - [onThird]: An optional callback function for handling the [T2] type value.
  ///   - [onFourth]: An optional callback function for handling the [T3] type value.
  ///   - [onFifth]: An optional callback function for handling the [T4] type value.
  ///   - [onSixth]: An optional callback function for handling the [T5] type value.
  ///   - [onSeventh]: An optional callback function for handling the [T6] type value.
  ///   - [onEighth]: An optional callback function for handling the [T7] type value.
  ///
  /// - Throws: Propagates any exceptions from [functionToExecute].
  static Future<void> run<T0, T1, T2, T3, T4, T5, T6, T7>({
    required Future<Octet<T0, T1, T2, T3, T4, T5, T6, T7>> Function() functionToExecute,
    Future<void> Function(T0)? onFirst,
    Future<void> Function(T1)? onSecond,
    Future<void> Function(T2)? onThird,
    Future<void> Function(T3)? onFourth,
    Future<void> Function(T4)? onFifth,
    Future<void> Function(T5)? onSixth,
    Future<void> Function(T6)? onSeventh,
    Future<void> Function(T7)? onEighth,
  }) async {
    var response = await functionToExecute();

    await response.on(
      first: onFirst,
      second: onSecond,
      third: onThird,
      fourth: onFourth,
      fifth: onFifth,
      sixth: onSixth,
      seventh: onSeventh,
      eighth: onEighth,
    );
  }
}
