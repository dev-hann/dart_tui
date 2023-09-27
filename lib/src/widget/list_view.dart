import 'dart:math';

import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

enum Axis {
  horizontal,
  vertical,
}

@Deprecated("not yet")
class ListView extends Widget {
  ListView({
    this.scrollDicrection = Axis.vertical,
    int initPosition = 0,
    this.controller,
    required this.children,
  }) : _position = initPosition;
  final ScrollController? controller;
  final List<Widget> children;
  final Axis scrollDicrection;

  int _position = 0;

  // TODO: make [Viewport], handle list view.
  @override
  Size layout(Size parentSize) {
    int childrenHeight = 0;
    int childrenWidth = 0;
    final chidrenLength = children.length;
    for (int index = 0; index < chidrenLength; index++) {
      if (childrenHeight >= parentSize.height) {
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

  @override
  void paint(Painter painter, Parent parent) {
    final parentSize = parent.size;
    final parentOffset = parent.offset;
    final size = layout(parentSize);
    final childCount = children.length;

    int offsetY = 0;
    for (int index = 0; index < childCount; index++) {
      final child = children[index];
      final childSize = child.layout(size);

      if (offsetY < _position) {
        offsetY += childSize.height;
        continue;
      }

      final childOffset = Offset(0, offsetY - _position);
      final clipSize = size.height - (offsetY + childSize.height);
      if (clipSize < 0) {
        break;
      }
      child.paint(
        painter,
        Parent(
          size: Size(size.width, clipSize),
          offset: parentOffset + childOffset,
        ),
      );
      offsetY += childSize.height;
    }
  }
}

// TODO: make [Listenable] and [ChangeNotifier]
class ScrollController {}
