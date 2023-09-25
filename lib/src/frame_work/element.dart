import 'package:dart_tui/src/frame_work/build_context.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/widget/stateless.dart';
import 'package:dart_tui/src/widget/widget.dart';
import 'package:meta/meta.dart';

abstract class Element implements BuildContext {
  Element(Widget widget) : _widget = widget;
  Widget? _widget;

  @override
  Widget get widget => _widget!;

  bool _dirty = true;
  bool get dirty => _dirty;

  Element? _parent;

  Object? get slot => _slot;
  Object? _slot;

  @mustCallSuper
  void mount(Element? parent, Object? newSlot) {
    _parent = parent;
    _slot = newSlot;
  }

  @mustCallSuper
  void update(covariant Widget newWidget) {
    _widget = newWidget;
  }

  void rebuild({bool force = false}) {}
  @mustCallSuper
  void performRebuild() {
    _dirty = false;
  }

  void markNeedsBuild() {
    _dirty = true;
  }
}

abstract class RenderObjectElement extends Element {
  RenderObjectElement(RenderObjectWidget super.widget);
}

abstract class ComponentElement extends Element {
  ComponentElement(super.widget);

  @override
  void performRebuild() {
    super.performRebuild();
  }

  Widget build();
}

class StatlessElement extends ComponentElement {
  StatlessElement(super.widget);

  @override
  Widget build() => (widget as StatelessWidget).build(this);
}
