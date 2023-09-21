import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

abstract class RenderObjectWidget extends Widget {
  List<Pixel> paint(Size size);
}
