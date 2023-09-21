import 'package:dart_tui/src/offset.dart';

class Size {
  Size(this.width, this.height);
  final int width;
  final int height;

  Offset get center {
    return Offset(width ~/ 2, height ~/ 2);
  }
}
