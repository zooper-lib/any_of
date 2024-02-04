import 'package:any_of/any_of.dart';

class NotFound extends AnyOfType {
  final String message;

  NotFound(this.message);

  @override
  String toString() => '$NotFound: $message';
}
