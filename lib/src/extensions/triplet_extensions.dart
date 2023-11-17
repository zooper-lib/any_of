import 'package:any_of/any_of.dart';

extension TripletExtensions<T0, T1, T2> on Triplet<T0, T1, T2> {
  R? map<R>({
    R Function(T0)? first,
    R Function(T1)? second,
    R Function(T2)? third,
  }) {
    if (isFirst && first != null) {
      return first(this.first);
    } else if (isSecond && second != null) {
      return second(this.second);
    } else if (isThird && third != null) {
      return third(this.third);
    } else {
      throw Exception('Triplet is empty or functions are null');
    }
  }

  void on<R>({
    void Function(T0)? first,
    void Function(T1)? second,
    void Function(T2)? third,
  }) {
    if (isFirst) {
      return first?.call(this.first);
    } else if (isSecond) {
      return second?.call(this.second);
    } else if (isThird) {
      return third?.call(this.third);
    } else {
      throw Exception('Triplet is empty');
    }
  }

  void ifType<R>({
    required void Function(R) callback,
  }) {
    if (isFirst && first is R) {
      callback(first as R);
    } else if (isSecond && second is R) {
      callback(second as R);
    } else if (isThird && third is R) {
      callback(third as R);
    }
  }
}
