import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/align_widget.dart';

class Center extends AlignWidget {
  Center({
    required super.child,
  });

  @override
  Size layout(Size parentSize) {
    return parentSize;
  }

  @override
  void paint(Painter painter) {
    final parentSize = painter.parentSize;
    final centerOffset = parentSize.center;
    final childSize = child.layout(parentSize);
    child.paint(
      Painter(
        parentSize: parentSize,
        offset: Offset(
          centerOffset.x - (childSize.width ~/ 2) + 1,
          centerOffset.y - (childSize.height ~/ 2),
        ),
      ),
    );
  }

  @override
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }
}
