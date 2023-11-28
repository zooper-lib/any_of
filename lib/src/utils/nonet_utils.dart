import 'package:any_of/any_of.dart';

class NonetUtils {
  /// Executes a function that returns a [Future] of [Nonet<T0, T1, T2, T3, T4, T5, T6, T7, T8>] and applies callbacks based on the [Nonet]'s value.
  ///
  /// This static method asynchronously executes [functionToExecute] and then uses the [on] method
  /// to execute the appropriate callback based on the value's type in the returned [Nonet].
  ///
  /// - Parameters:
  ///   - [functionToExecute]: A function returning a [Future] of [Nonet<T0, T1, T2, T3, T4, T5, T6, T7, T8>].
  ///   - [onFirst]: An optional callback function for handling the [T0] type value.
  ///   - [onSecond]: An optional callback function for handling the [T1] type value.
  ///   - [onThird]: An optional callback function for handling the [T2] type value.
  ///   - [onFourth]: An optional callback function for handling the [T3] type value.
  ///   - [onFifth]: An optional callback function for handling the [T4] type value.
  ///   - [onSixth]: An optional callback function for handling the [T5] type value.
  ///   - [onSeventh]: An optional callback function for handling the [T6] type value.
  ///   - [onEighth]: An optional callback function for handling the [T7] type value.
  ///   - [onNinth]: An optional callback function for handling the [T8] type value.
  ///
  /// - Throws: Propagates any exceptions from [functionToExecute].
  static Future<void> run<T0, T1, T2, T3, T4, T5, T6, T7, T8>({
    required Future<Nonet<T0, T1, T2, T3, T4, T5, T6, T7, T8>> Function() functionToExecute,
    void Function(T0)? onFirst,
    void Function(T1)? onSecond,
    void Function(T2)? onThird,
    void Function(T3)? onFourth,
    void Function(T4)? onFifth,
    void Function(T5)? onSixth,
    void Function(T6)? onSeventh,
    void Function(T7)? onEighth,
    void Function(T8)? onNinth,
  }) async {
    var response = await functionToExecute();

    response.on(
      first: onFirst,
      second: onSecond,
      third: onThird,
      fourth: onFourth,
      fifth: onFifth,
      sixth: onSixth,
      seventh: onSeventh,
      eighth: onEighth,
      ninth: onNinth,
    );
  }
}
