import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';

class Terminal {
  Terminal({
    required this.paintBuilder,
  }) {
    paintBuilder(this);
    resizeWindowStream().listen((_) {
      paintBuilder(this);
    });
  }
  final Function(Terminal terminal) paintBuilder;

  Size get wiindowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }

  Stream resizeWindowStream() {
    return ProcessSignal.sigwinch.watch();
  }

  void write(Pixel pixel) {
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

  void hideCursor() {
    stdout.write('\x1b[?25l');
  }

  void showCursor() {
    stdout.write('\x1b[?25h');
  }

  void move(Offset offset) {
    stdout.write('\x1b[${offset.y + 1};${offset.x + 1}H');
  }

  void clearAll() {
    stdout.write('\x1b[2J');
  }
}
