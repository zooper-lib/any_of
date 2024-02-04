import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Octet<T0, T1, T2, T3, T4, T5, T6, T7> extends Septet<T0, T1, T2, T3, T4, T5, T6> with EquatableMixin {
  final T7? _eighth;

  Octet.first(T0 value) : this(value, null, null, null, null, null, null, null);
  Octet.second(T1 value) : this(null, value, null, null, null, null, null, null);
  Octet.third(T2 value) : this(null, null, value, null, null, null, null, null);
  Octet.fourth(T3 value) : this(null, null, null, value, null, null, null, null);
  Octet.fifth(T4 value) : this(null, null, null, null, value, null, null, null);
  Octet.sixth(T5 value) : this(null, null, null, null, null, value, null, null);
  Octet.seventh(T6 value) : this(null, null, null, null, null, null, value, null);
  Octet.eighth(T7 value) : this(null, null, null, null, null, null, null, value);

  Octet(super.first, super.second, super.third, super.fourth, super.fifth, super.sixth, super.seventh, this._eighth);

  bool get isEighth => _eighth != null;

  T7 get eighth => _eighth!;

  @override
  List<Object?> get props => [
        ...super.props,
        _eighth,
      ];
}
