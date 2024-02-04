import 'package:any_of/any_of.dart';

class PermissionDenied extends AnyOfType {
  final String message;

  PermissionDenied(this.message);

  @override
  String toString() => '$PermissionDenied: $message';
}
