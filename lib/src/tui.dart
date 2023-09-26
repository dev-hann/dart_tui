import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/view/view.dart';

typedef ViewBuilder = View Function();

class Tui {
  static late final Painter _viewPainter;

  static Stream get resizeWindowStrem => ProcessSignal.sigwinch.watch();
  static runApp(
    ViewBuilder initWidget,
  ) {
    _viewPainter = Painter(
      parentSize: windowSize,
      offset: Offset.zero,
    );
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
    hideCursor();
    clearAll();
    // final size = windowSize;
    _currentView.paint(_viewPainter);
  }

  static Size get windowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }

  static void writeList(List<Pixel> list) {
    for (final pixel in list) {
      write(pixel);
    }
  }

  static void write(Pixel pixel) {
    move(pixel.offset);
    final foreground = pixel.foreground;
    if (foreground != null) {
      stdout.write("\x1b[3${foreground.value}m");
    }
    final background = pixel.background;
    if (background != null) {
      stdout.write('\x1b[4${background.value}m');
    }
    stdout.write(pixel.char);
  }

  static void hideCursor() {
    stdout.write('\x1b[?25l');
  }

  static void showCursor() {
    stdout.write('\x1b[?25h');
  }

  static void move(Offset offset) {
    stdout.write('\x1b[${offset.y + 1};${offset.x + 1}H');
  }

  static void clearAll() {
    stdout.write('\x1b[2J');
  }
}
