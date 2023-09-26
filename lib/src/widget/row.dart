import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';
import 'dart:math' as math;

// enum CrossAxisAlignment {
//   start,
//   end,
//   center,
//   stretch,
//   baseline,
// }

// FIXME: layout between item ratio..
enum MainAxisAlignment {
  start,
  end,
  center,
  // spaceBetween,
  // spaceAround,
  // spaceEvenly,
}

// TODO: make [Flex] widget.
class Row extends Widget {
  Row({
    required this.children,
    // this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final List<Widget> children;
  // final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  int _computeChildrenSize(Size parentSize) {
    int offsetY = 0;
    final chidrenLength = children.length;
    for (int index = 0; index < chidrenLength; index++) {
      final child = children[index];
      final childSize = child.layout(parentSize);
      offsetY += childSize.height;
    }
    return offsetY;
  }

  @override
  Size layout(Size parentSize) {
    int height = 0;
    int width = 0;
    final chidrenLength = children.length;
    for (int index = 0; index < chidrenLength; index++) {
      final child = children[index];
      final childSize = child.layout(parentSize);
      if (height < childSize.height) {
        height = childSize.height;
      }
      width += childSize.width;
    }
    return Size(width, height);
  }

  @override
  void paint(Painter painter) {
    final parentSize = painter.parentSize;
    final actualSize = parentSize.height;
    final childCount = children.length;
    // if (height < children.map((e) => e.layout(parentSize).height).reduce((value, element) => null)) {
    //   return throwOverflowLayout("");
    // }
    final allocatedSize = _computeChildrenSize(parentSize);
    final int actualSizeDelta = actualSize - allocatedSize;
    // _overflow = math.max(0.0, -actualSizeDelta);
    final int remainingSpace = math.max(0, actualSizeDelta);
    late final int leadingSpace;
    late final int betweenSpace;

    switch (mainAxisAlignment) {
      case MainAxisAlignment.start:
        leadingSpace = 0;
        betweenSpace = 0;
      case MainAxisAlignment.end:
        leadingSpace = remainingSpace;
        betweenSpace = 0;
      case MainAxisAlignment.center:
        leadingSpace = (remainingSpace / 2).round();
        betweenSpace = 0;
      // case MainAxisAlignment.spaceBetween:
      //   leadingSpace = 0;
      //   betweenSpace = childCount > 1 ? remainingSpace ~/ (childCount - 1) : 0;
      // case MainAxisAlignment.spaceAround:
      //   betweenSpace = childCount > 0 ? (remainingSpace ~/ childCount) : 0;
      //   leadingSpace = betweenSpace ~/ 2;
      // case MainAxisAlignment.spaceEvenly:
      //   betweenSpace =
      //       childCount > 0 ? (remainingSpace / (childCount + 1)).round() : 0;
      //   leadingSpace = betweenSpace;
    }

    int offsetX = leadingSpace;
    for (int index = 0; index < childCount; index++) {
      final child = children[index];
      child.paint(
        Painter(
          parentSize: parentSize,
          offset: painter.offset.add(
            Offset(offsetX, 0),
          ),
        ),
      );
      offsetX += child.layout(parentSize).width + betweenSpace;
    }
  }

  @override
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }
}