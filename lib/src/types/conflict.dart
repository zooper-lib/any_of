import 'package:any_of/any_of.dart';

class Conflict extends AnyOfType {
  final String message;

  Conflict(this.message);

  @override
  String toString() => 'Conflict: $message';
}
