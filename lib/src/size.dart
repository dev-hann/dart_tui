import 'package:dart_tui/src/offset.dart';

class Size {
  const Size(this.width, this.height);
  final int width;
  final int height;

  static const zero = Size(0, 0);

  Offset get center {
    return Offset(width ~/ 2, height ~/ 2);
  }

  @override
  String toString() {
    return "$runtimeType{$width,$height}";
  }
}
