import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Nonet<T0, T1, T2, T3, T4, T5, T6, T7, T8> extends Octet<T0, T1, T2, T3, T4, T5, T6, T7> with EquatableMixin {
  final T8? _ninth;

  Nonet.first(T0 value) : this(value, null, null, null, null, null, null, null, null);
  Nonet.second(T1 value) : this(null, value, null, null, null, null, null, null, null);
  Nonet.third(T2 value) : this(null, null, value, null, null, null, null, null, null);
  Nonet.fourth(T3 value) : this(null, null, null, value, null, null, null, null, null);
  Nonet.fifth(T4 value) : this(null, null, null, null, value, null, null, null, null);
  Nonet.sixth(T5 value) : this(null, null, null, null, null, value, null, null, null);
  Nonet.seventh(T6 value) : this(null, null, null, null, null, null, value, null, null);
  Nonet.eighth(T7 value) : this(null, null, null, null, null, null, null, value, null);
  Nonet.ninth(T8 value) : this(null, null, null, null, null, null, null, null, value);

  Nonet(T0? first, T1? second, T2? third, T3? fourth, T4? fifth, T5? sixth, T6? seventh, T7? eighth, this._ninth)
      : super(first, second, third, fourth, fifth, sixth, seventh, eighth);

  bool get isNinth => _ninth != null;

  T8 get ninth => _ninth!;

  @override
  List<Object?> get props => [
        ...super.props,
        _ninth,
      ];
}
