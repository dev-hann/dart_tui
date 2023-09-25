import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

typedef WidgetBuilder = Widget Function();

class Tui {
  static Stream get resizeWindowStrem => ProcessSignal.sigwinch.watch();
  static late final Painter _painter;
  static runApp(
    WidgetBuilder initWidget,
  ) {
    resizeWindowStrem.listen((_) {});
    // update(() => initWidget());
    attachRootWidget(initWidget());
  }

  static void update(
    WidgetBuilder widgetBuilder,
  ) {
    final widget = widgetBuilder();
    if (widget is RenderObjectWidget) {
      widget.createRenderObject().paint(_painter, Offset.zero);
    }
  }

  static Size get wiindowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }

  static void attachRootWidget(Widget rootWidget) {
    final element = rootWidget.createElement();
    element.mount(null, null);
    element.markNeedsBuild();
  }
}
