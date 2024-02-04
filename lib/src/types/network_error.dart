import 'package:any_of/any_of.dart';

class NetworkError extends AnyOfType {
  final String message;

  NetworkError(this.message);

  @override
  String toString() => '$NetworkError: $message';
}
