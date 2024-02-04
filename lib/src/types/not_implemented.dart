import 'package:any_of/any_of.dart';

class NotImplemented extends AnyOfType {
  final String message;

  NotImplemented(this.message);

  @override
  String toString() => '$NotImplemented: $message';
}
