import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  const Offset(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  static const Offset zero = Offset(0, 0);
  Offset operator +(Offset other) {
    return Offset(x + other.x, y + other.y);
  }

  Offset operator -(Offset other) {
    return Offset(x - other.x, y - other.y);
  }

  @override
  String toString() {
    return "$runtimeType:{$x,$y}";
  }
}
