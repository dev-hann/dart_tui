import 'package:equatable/equatable.dart';

class Offset extends Equatable {
  Offset(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  Offset add(Offset other) {
    return Offset(x + other.x, y + other.y);
  }
}
