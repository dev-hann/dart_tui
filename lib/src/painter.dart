import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';

class Painter {
  Painter({
    bool echoMode = false,
    bool lineMode = false,
  }) {
    this.echoMode(echoMode);
    this.lineMode(lineMode);
  }

  Size get windowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }

  void writeList(
    List<Pixel> list,
  ) {
    for (final pixel in list) {
      write(pixel);
    }
  }

  void write(Pixel pixel) {
    move(pixel.offset);
    final style = pixel.style;
    stdout.write(style.toPrompt());
    final foreground = style.foreground;
    stdout.write("\x1b[3${foreground.value}m");
    final background = style.background;
    stdout.write('\x1b[4${background.value}m');
    stdout.write(pixel.char);
  }

  void move(Offset offset) {
    stdout.write('\x1b[${offset.y + 1};${offset.x + 1}H');
  }

  void clearAll() {
    stdout.write('\x1b[2J');
  }

  void hideCursor() {
    stdout.write('\x1b[?25l');
  }

  void showCursor() {
    stdout.write('\x1b[?25h');
  }

  void echoMode(bool value) {
    stdin.echoMode = value;
  }

  void lineMode(bool value) {
    stdin.lineMode = value;
  }
}
