import 'package:any_of/any_of.dart';

class ServiceUnavailable extends AnyOfType {
  final String message;

  ServiceUnavailable(this.message);

  @override
  String toString() => '$ServiceUnavailable: $message';
}
