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

  Octet(T0? first, T1? second, T2? third, T3? fourth, T4? fifth, T5? sixth, T6? seventh, this._eighth)
      : super(first, second, third, fourth, fifth, sixth, seventh);

  bool get isEighth => _eighth != null;

  T7 get eighth => _eighth!;

  @override
  List<Object?> get props => [
        ...super.props,
        _eighth,
      ];
}
