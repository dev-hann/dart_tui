import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
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
    final childSize = child?.layout(parentSize) ?? Size(1, 1);
    final w = width ?? childSize.width;
    final h = height ?? childSize.height;
    return Size(w, h);
  }

  @override
  void paint(Painter painter, Parent parent) {
    final size = layout(parent.size);
    final parentOffset = parent.offset;
    // FIXME: make it 0xN OR Nx0 size.
    for (int y = 0; y < size.height; y++) {
      for (int x = 0; x < size.width; x++) {
        final pixel = Pixel(
          offset: parentOffset + Offset(x, y),
          char: " ",
        );
        painter.write(pixel);
      }
    }
    child?.paint(
      painter,
      Parent(
        size: size,
        offset: parentOffset,
      ),
    );
  }
}
