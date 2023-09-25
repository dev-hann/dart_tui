import 'package:dart_tui/src/render_object/render_object.dart';
import 'package:dart_tui/src/widget/widget.dart';

abstract class RenderObjectWidget extends Widget {
  RenderObject createRenderObject();
  void updateRenderObject(covariant RenderObject renderObject) {}
}
