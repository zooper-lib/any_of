import 'package:any_of/any_of.dart';

class InternalError extends AnyOfType {
  final String message;

  InternalError(this.message);

  @override
  String toString() => 'InternalError: $message';
}
