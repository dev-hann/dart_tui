import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Align extends Widget {
  Align({
    required this.child,
    required this.alignment,
  });
  final Widget child;
  final Alignment alignment;

  @override
  Size layout(Size parentSize) {
    return parentSize;
  }

  @override
  void paint(Painter painter, Parent parent) {
    final parentSize = parent.size;
    final centerOffset = parentSize.center;
    final childSize = child.layout(parentSize);

    int offsetX = 0;
    int offsetY = 0;
    switch (alignment) {
      case Alignment.topLeft:
        break;
      case Alignment.topCenter:
        offsetX = centerOffset.x - (childSize.width ~/ 2);
        break;
      case Alignment.topRight:
        offsetX = parentSize.width - (childSize.width);
        break;
      case Alignment.center:
        offsetX = centerOffset.x - (childSize.width ~/ 2);
        offsetY = parentSize.height ~/ 2;
        break;
      case Alignment.centerLeft:
        offsetY = parentSize.height ~/ 2;
        break;
      case Alignment.centerRight:
        offsetY = parentSize.height ~/ 2;
        offsetX = parentSize.width - (childSize.width);
        break;
      case Alignment.bottomLeft:
        offsetY = parentSize.height - childSize.height;
        break;
      case Alignment.bottomCenter:
        offsetY = parentSize.height - childSize.height;
        offsetX = centerOffset.x - (childSize.width ~/ 2);
        break;
      case Alignment.bottomRight:
        offsetY = parentSize.height - childSize.height;
        offsetX = parentSize.width - (childSize.width);
        break;
    }
    child.paint(
      painter,
      Parent(
        size: parentSize,
        offset: parent.offset + Offset(offsetX, offsetY),
      ),
    );
  }
}

enum Alignment {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}
