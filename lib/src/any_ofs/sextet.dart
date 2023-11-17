import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Sextet<T0, T1, T2, T3, T4, T5> extends Quintet<T0, T1, T2, T3, T4> with EquatableMixin {
  final T5? _sixth;

  Sextet.first(T0 value) : this(value, null, null, null, null, null);
  Sextet.second(T1 value) : this(null, value, null, null, null, null);
  Sextet.third(T2 value) : this(null, null, value, null, null, null);
  Sextet.fourth(T3 value) : this(null, null, null, value, null, null);
  Sextet.fifth(T4 value) : this(null, null, null, null, value, null);
  Sextet.sixth(T5 value) : this(null, null, null, null, null, value);

  Sextet(T0? first, T1? second, T2? third, T3? fourth, T4? fifth, this._sixth)
      : super(first, second, third, fourth, fifth);

  bool get isSixth => _sixth != null;

  T5 get sixth => _sixth!;

  @override
  List<Object?> get props => [
        ...super.props,
        _sixth,
      ];
}
