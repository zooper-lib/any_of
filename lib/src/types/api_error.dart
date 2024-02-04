import 'package:any_of/any_of.dart';

class ApiError extends AnyOfType {
  final String message;

  ApiError(this.message);

  @override
  String toString() => 'ApiError: $message';
}
