import 'package:any_of/any_of.dart';

class TimedOut extends AnyOfType {
  final String message;

  TimedOut(this.message);

  @override
  String toString() => '$TimedOut: $message';
}
