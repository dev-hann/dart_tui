import 'package:dart_tui/src/offset.dart';

class Size {
  Size(this.width, this.height);
  final int width;
  final int height;

  factory Size.min() {
    return Size(0, 0);
  }

  Offset get center {
    return Offset(width ~/ 2, height ~/ 2);
  }

  @override
  String toString() {
    return "$runtimeType{$width,$height}";
  }
}
