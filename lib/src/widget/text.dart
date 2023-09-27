import 'dart:math';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/text_style.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Text extends Widget {
  Text(
    this.text, {
    this.style = const TextStyle(),
  });
  final String text;
  final TextStyle style;

  @override
  Size layout(Size parentSize) {
    final splitted = text.split('\n');
    final textMaxWidth = splitted.map((e) => e.length).reduce(max);
    final textMaxHeight = splitted.length;
    final maxLines = style.maxLine ?? parentSize.height;

    final h = min(maxLines, textMaxHeight);
    final w = min(parentSize.width, textMaxWidth);

    return Size(w, h);
  }

  @override
  void paint(Painter painter, Parent parent) {
    final size = layout(parent.size);
    final splitted = text.split('\n');
    for (int line = 0; line < size.height; line++) {
      String text = splitted[line];
      if (text.length > size.width) {
        switch (style.overflow) {
          case TextOverflow.clip:
            text = text.substring(0, size.width);
          case TextOverflow.ellipsis:
            text = text.substring(0, size.width - 2);
            text += "..";
        }
      }
      painter.write(
        Pixel(
          offset: parent.offset + Offset(0, line),
          char: text,
          style: style,
        ),
      );
    }
  }
}
