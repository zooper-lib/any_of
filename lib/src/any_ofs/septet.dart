import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Septet<T0, T1, T2, T3, T4, T5, T6> extends Sextet<T0, T1, T2, T3, T4, T5> with EquatableMixin {
  final T6? _seventh;

  Septet.first(T0 value) : this(value, null, null, null, null, null, null);
  Septet.second(T1 value) : this(null, value, null, null, null, null, null);
  Septet.third(T2 value) : this(null, null, value, null, null, null, null);
  Septet.fourth(T3 value) : this(null, null, null, value, null, null, null);
  Septet.fifth(T4 value) : this(null, null, null, null, value, null, null);
  Septet.sixth(T5 value) : this(null, null, null, null, null, value, null);
  Septet.seventh(T6 value) : this(null, null, null, null, null, null, value);

  Septet(super.first, super.second, super.third, super.fourth, super.fifth, super.sixth, this._seventh);

  bool get isSeventh => _seventh != null;

  T6 get seventh => _seventh!;

  @override
  List<Object?> get props => [
        ...super.props,
        _seventh,
      ];
}
