import 'any_of_type.dart';

class NotFound extends AnyOfType {
  final String message;

  NotFound(this.message);

  @override
  String toString() => 'NotFound: $message';
}
