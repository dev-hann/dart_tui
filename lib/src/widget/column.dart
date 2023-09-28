import 'dart:math';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
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

// // TODO: make [Flex] widget.
class Column extends Widget {
  Column({
    required this.children,
    // this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final List<Widget> children;
  // final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Size layout(Size parentSize) {
    int childrenHeight = 0;
    int childrenWidth = 0;
    final chidrenLength = children.length;
    for (int index = 0; index < chidrenLength; index++) {
      if (childrenHeight > parentSize.height) {
        break;
      }
      final child = children[index];
      final childSize = child.layout(parentSize);
      if (childrenWidth < childSize.width) {
        childrenWidth = childSize.width;
      }
      childrenHeight += childSize.height;
    }
    final w = min(parentSize.width, childrenWidth);
    final h = min(parentSize.height, childrenHeight);

    return Size(w, h);
  }

  // FIXME: logic
  @override
  void paint(Painter painter, Parent parent) {
    final parentSize = parent.size;
    final parentHeight = parentSize.height;
    // if (height < children.map((e) => e.layout(parentSize).height).reduce((value, element) => null)) {
    //   return throwOverflowLayout("");
    // }
    final childrenHeight = layout(parentSize).height;
    final int actualSizeDelta = parentHeight - childrenHeight;
    // _overflow = math.max(0.0, -actualSizeDelta);
    final int remainingSpace = math.max(0, actualSizeDelta);
    late final int leadingSpace;
    late final int betweenSpace;

    switch (mainAxisAlignment) {
      case MainAxisAlignment.start:
        leadingSpace = 0;
        betweenSpace = 0;
        break;
      case MainAxisAlignment.end:
        leadingSpace = remainingSpace;
        betweenSpace = 0;
        break;
      case MainAxisAlignment.center:
        leadingSpace = (remainingSpace / 2).round();
        betweenSpace = 0;
        break;
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

    final childCount = children.length;
    int offsetY = leadingSpace;
    for (int index = 0; index < childCount; index++) {
      final child = children[index];
      child.paint(
        painter,
        Parent(
          size: parentSize,
          offset: parent.offset + Offset(0, offsetY),
        ),
      );
      offsetY += child.layout(parentSize).height + betweenSpace;
    }
  }
}
