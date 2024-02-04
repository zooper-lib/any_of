import 'any_of_type.dart';

class UnknownError extends AnyOfType {
  final String message;

  UnknownError(this.message);

  @override
  String toString() => 'UnknownError: $message';
}
