import 'package:equatable/equatable.dart';

class Doublet<T0, T1> with EquatableMixin {
  final T0? _first;
  final T1? _second;

  Doublet.first(T0 value) : this(value, null);
  Doublet.second(T1 value) : this(null, value);

  Doublet(this._first, this._second);

  bool get isFirst => _first != null;
  bool get isSecond => _second != null;

  T0 get first => _first!;
  T1 get second => _second!;

  @override
  List<Object?> get props => [_first, _second];
}
