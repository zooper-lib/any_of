import 'package:any_of/any_of.dart';

class QuintetUtils {
  /// Executes a function that returns a [Future] of [Quintet<T0, T1, T2, T3, T4>] and applies callbacks based on the [Quintet]'s value.
  ///
  /// This static method asynchronously executes [functionToExecute] and then uses the [on] method
  /// to execute the appropriate callback based on the value's type in the returned [Quintet].
  ///
  /// - Parameters:
  ///   - [functionToExecute]: A function returning a [Future] of [Quintet<T0, T1, T2, T3, T4>].
  ///   - [onFirst]: An optional callback function for handling the [T0] type value.
  ///   - [onSecond]: An optional callback function for handling the [T1] type value.
  ///   - [onThird]: An optional callback function for handling the [T2] type value.
  ///   - [onFourth]: An optional callback function for handling the [T3] type value.
  ///   - [onFifth]: An optional callback function for handling the [T4] type value.
  ///
  /// - Throws: Propagates any exceptions from [functionToExecute].
  static Future<void> run<T0, T1, T2, T3, T4>({
    required Future<Quintet<T0, T1, T2, T3, T4>> Function() functionToExecute,
    void Function(T0)? onFirst,
    void Function(T1)? onSecond,
    void Function(T2)? onThird,
    void Function(T3)? onFourth,
    void Function(T4)? onFifth,
  }) async {
    var response = await functionToExecute();

    response.on(
      first: onFirst,
      second: onSecond,
      third: onThird,
      fourth: onFourth,
      fifth: onFifth,
    );
  }
}
