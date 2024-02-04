import 'package:any_of/any_of.dart';

class SerializationError extends AnyOfType {
  final String message;

  SerializationError(this.message);

  @override
  String toString() => 'SerializationError: $message';
}
