import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  const Offset(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  const Offset.zero()
      : x = 0,
        y = 0;

  Offset add(Offset other) {
    return Offset(x + other.x, y + other.y);
  }
}
