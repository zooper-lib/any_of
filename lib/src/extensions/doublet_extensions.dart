import 'package:any_of/any_of.dart';

extension DoubletExtensions<T0, T1> on Doublet<T0, T1> {
  R map<R>({
    required R Function(T0)? first,
    required R Function(T1)? second,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else {
      throw Exception('Doublet is empty');
    }
  }

  void on<R>({
    void Function(T0)? first,
    void Function(T1)? second,
  }) {
    if (isFirst) {
      return first?.call(this.first);
    } else if (isSecond) {
      return second?.call(this.second);
    } else {
      throw Exception('Doublet is empty');
    }
  }

  void ifType<R>({
    required void Function(R) callback,
  }) {
    if (isFirst && first is R) {
      callback(first as R);
    } else if (isSecond && second is R) {
      callback(second as R);
    }
  }
}
