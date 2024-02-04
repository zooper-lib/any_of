import 'package:any_of/any_of.dart';

class BadRequest extends AnyOfType {
  final String message;

  BadRequest(this.message);

  @override
  String toString() => '$BadRequest: $message';
}
