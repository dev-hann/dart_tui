import 'dart:math';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Padding extends Widget {
  Padding({
    required this.padding,
    required this.child,
  });
  final EdgeInsets padding;
  final Widget child;

  @override
  Size layout(Size parentSize) {
    return child.layout(parentSize) +
        Size(padding.horizontal, padding.vertical);
    // return child.layout(parentSize);
    // final childSize =
    //     child.layout(parentSize) + Size(padding.horizontal, padding.vertical);
    // final w = min(parentSize.width, childSize.width);
    // final h = min(parentSize.height, childSize.height);
    // return Size(w, h);
  }

  @override
  void paint(Painter painter, Parent parent) {
    child.paint(
      painter,
      Parent(
        size: layout(parent.size),
        offset: parent.offset + Offset(padding.left, padding.top),
      ),
    );
  }
}

class EdgeInsets {
  final int left;
  final int right;
  final int top;
  final int bottom;

  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);

  const EdgeInsets.all(int value)
      : left = value,
        top = value,
        right = value,
        bottom = value;
  const EdgeInsets.only({
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });
  const EdgeInsets.symmetric({
    int vertical = 0,
    int horizontal = 0,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;
  int get horizontal => left + right;

  int get vertical => top + bottom;
}
