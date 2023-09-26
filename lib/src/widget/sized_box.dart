import 'dart:math';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class SizedBox extends Widget {
  SizedBox({
    this.width,
    this.height,
    this.child,
  });
  final Widget? child;
  final int? width;
  final int? height;

  @override
  Size layout(Size parentSize) {
    final childSize = child?.layout(parentSize) ?? Size.zero;
    final w = max(width ?? childSize.width, 1);
    final h = max(height ?? childSize.height, 1);
    return Size(w, h);
  }

  @override
  void paint(Painter painter) {
    final size = layout(painter.parentSize);
    final parentOffset = painter.offset;

    // FIXME: make it 0xN OR Nx0 size.
    for (int y = 0; y < size.height; y++) {
      for (int x = 0; x < size.width; x++) {
        final pixel = Pixel(
          offset: parentOffset.add(Offset(x, y)),
          char: " ",
        );
        painter.write(pixel);
      }
    }
  }

  @override
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }
}
