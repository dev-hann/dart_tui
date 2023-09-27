import 'dart:io';

import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/view/view.dart';

typedef ViewBuilder = View Function();

class Tui {
  static late final Painter _viewPainter;

  static Stream get resizeWindowStrem => ProcessSignal.sigwinch.watch();
  static runApp(
    ViewBuilder initWidget,
  ) {
    _viewPainter = Painter();
    _currentView = initWidget();
    resizeWindowStrem.listen((_) {
      update(() => _currentView);
    });
    update(() => _currentView);
  }

  static late View _currentView;

  static void update(
    ViewBuilder viewBuilder,
  ) {
    _currentView = viewBuilder();
    Painter.hideCursor();
    Painter.clearAll();
    _currentView.paint(
      _viewPainter,
      Parent(size: windowSize),
    );
  }

  static Size get windowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }
}
