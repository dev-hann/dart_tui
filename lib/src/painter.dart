import 'dart:io';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Painter {
  Painter({
    required this.parentSize,
    required this.offset,
  });
  final Size parentSize;
  final Offset offset;

  static Size get windowSize {
    final height = stdout.terminalLines;
    final width = stdout.terminalColumns;
    return Size(width, height);
  }

  void writeList(List<Pixel> list) {
    for (final pixel in list) {
      write(
        pixel.copyWith(
          offset: pixel.offset.add(offset),
        ),
      );
    }
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
