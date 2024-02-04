import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Quintet<T0, T1, T2, T3, T4> extends Quartet<T0, T1, T2, T3> with EquatableMixin {
  final T4? _fifth;

  Quintet.first(T0 value) : this(value, null, null, null, null);
  Quintet.second(T1 value) : this(null, value, null, null, null);
  Quintet.third(T2 value) : this(null, null, value, null, null);
  Quintet.fourth(T3 value) : this(null, null, null, value, null);
  Quintet.fifth(T4 value) : this(null, null, null, null, value);

  Quintet(super.first, super.second, super.third, super.fourth, this._fifth);

  bool get isFifth => _fifth != null;

  T4 get fifth => _fifth!;

  @override
  List<Object?> get props => [
        ...super.props,
        _fifth,
      ];
}
