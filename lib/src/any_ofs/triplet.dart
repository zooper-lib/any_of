import 'package:equatable/equatable.dart';
import 'package:any_of/any_of.dart';

class Triplet<T0, T1, T2> extends Doublet<T0, T1> with EquatableMixin {
  final T2? _third;

  Triplet.first(T0 value) : this(value, null, null);
  Triplet.second(T1 value) : this(null, value, null);
  Triplet.third(T2 value) : this(null, null, value);

  Triplet(super.first, super.second, this._third);

  bool get isThird => _third != null;

  T2 get third => _third!;

  @override
  List<Object?> get props => [
        ...super.props,
        _third,
      ];
}
