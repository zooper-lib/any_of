import 'package:any_of/any_of.dart';

class DoubletUtils {
  /// Executes a function that returns a [Future] of [Doublet<T0, T1>] and applies callbacks based on the [Doublet]'s value.
  ///
  /// This static method asynchronously executes [functionToExecute] and then uses the [on] method
  /// to execute the appropriate callback based on the value's type in the returned [Doublet].
  ///
  /// - Parameters:
  ///   - [functionToExecute]: A function returning a [Future] of [Doublet<T0, T1>].
  ///   - [onFirst]: An optional callback function for handling the [T0] type value.
  ///   - [onSecond]: An optional callback function for handling the [T1] type value.
  ///
  /// - Throws: Propagates any exceptions from [functionToExecute].
  /// - Note: If neither [onFirst] nor [onSecond] callbacks are provided but corresponding values are present in the [Doublet],
  ///         the method does not perform any action for those values. If neither [onFirst] nor [onSecond] values are present,
  ///         an exception is thrown by the [on] method, assuming this behavior is implemented in [on].
  static Future<void> run<T0, T1>({
    required Future<Doublet<T0, T1>> Function() functionToExecute,
    Future<void> Function(T0)? onFirst,
    Future<void> Function(T1)? onSecond,
  }) async {
    var response = await functionToExecute();

    await response.on(
      first: onFirst,
      second: onSecond,
    );
  }
}
