import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  const Offset(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  static const Offset zero = Offset(0, 0);

  Offset add(Offset other) {
    return Offset(x + other.x, y + other.y);
  }
}
