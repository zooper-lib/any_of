import 'package:any_of/any_of.dart';

class TripletUtils {
  /// Executes a function that returns a [Future] of [Triplet<T0, T1, T2>] and applies callbacks based on the [Triplet]'s value.
  ///
  /// This static method asynchronously executes [functionToExecute] and then uses the [on] method
  /// to execute the appropriate callback based on the value's type in the returned [Triplet].
  ///
  /// - Parameters:
  ///   - [functionToExecute]: A function returning a [Future] of [Triplet<T0, T1, T2>].
  ///   - [onFirst]: An optional callback function for handling the [T0] type value.
  ///   - [onSecond]: An optional callback function for handling the [T1] type value.
  ///   - [onThird]: An optional callback function for handling the [T2] type value.
  ///
  /// - Throws: Propagates any exceptions from [functionToExecute].
  /// - Note: If neither of the callbacks corresponding to the present values in the [Triplet] are provided,
  ///         the method does not perform any action for those values.
  static Future<void> run<T0, T1, T2>({
    required Future<Triplet<T0, T1, T2>> Function() functionToExecute,
    void Function(T0)? onFirst,
    void Function(T1)? onSecond,
    void Function(T2)? onThird,
  }) async {
    var response = await functionToExecute();

    response.on(
      first: onFirst,
      second: onSecond,
      third: onThird,
    );
  }
}
