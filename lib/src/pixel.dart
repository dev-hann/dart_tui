import 'dart:core';

import 'package:dart_tui/src/color.dart';
import 'package:dart_tui/src/offset.dart';

class Pixel {
  Pixel({
    required this.offset,
    required this.char,
    this.style = const PixelStyle(),
  });
  final Offset offset;
  final String char;
  final PixelStyle style;

  Pixel copyWith({
    Offset? offset,
    String? char,
    PixelStyle? style,
  }) {
    return Pixel(
      offset: offset ?? this.offset,
      char: char ?? this.char,
      style: style ?? this.style,
    );
  }
}

class PixelStyle {
  const PixelStyle({
    this.bold = false,
    this.faint = false,
    this.italic = false,
    this.underscore = false,
    this.blink = false,
    this.inverted = false,
    this.invisible = false,
    this.strikethru = false,
    this.foreground = const Color.white(),
    this.background = const Color.black(),
  });
  final bool bold;
  final bool faint;
  final bool italic;
  final bool underscore;
  final bool blink;
  final bool inverted;
  final bool invisible;
  final bool strikethru;
  final Color foreground;
  final Color background;

  String toPrompt() {
    final styles = <int>[];
    if (bold) styles.add(1);
    if (faint) styles.add(2);
    if (italic) styles.add(3);
    if (underscore) styles.add(4);
    if (blink) styles.add(5);
    if (inverted) styles.add(7);
    if (invisible) styles.add(8);
    if (strikethru) styles.add(9);
    return '\x1b[${styles.join(";")}m';
  }
}
