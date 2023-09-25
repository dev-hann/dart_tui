import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';

abstract class RenderObject {
  void paint(Painter painter, Offset offset);
}
