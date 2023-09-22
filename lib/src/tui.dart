import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

typedef WidgetBuilder = Widget Function();

class Tui {
  static Stream get resizeWindowStrem => ProcessSignal.sigwinch.watch();

  static runApp(
    WidgetBuilder initWidget,
  ) {
    resizeWindowStrem.listen((_) {
      update(_currentWidgetBuilder!);
    });
    update(() => initWidget());
  }

  static WidgetBuilder? _currentWidgetBuilder;
  static void update(
    WidgetBuilder widgetBuilder,
  ) {
    _currentWidgetBuilder = widgetBuilder;
    hideCursor();
    clearAll();
    writeList(
      widgetBuilder().paint(wiindowSize),
    );
  }

  static Size get wiindowSize {
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
