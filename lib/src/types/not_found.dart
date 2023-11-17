import 'one_of_type.dart';

class NotFound extends OneOfType {
  final String message;

  NotFound(this.message);

  @override
  String toString() => 'NotFound: $message';
}
