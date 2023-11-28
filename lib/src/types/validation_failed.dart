import 'package:any_of/any_of.dart';

class ValidationFailed extends AnyOfType {
  final String message;

  ValidationFailed(this.message);

  @override
  String toString() => 'ValidationFailed: $message';
}
