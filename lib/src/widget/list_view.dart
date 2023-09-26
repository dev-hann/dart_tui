import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

enum Axis {
  horizontal,
  vertical,
}

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
  // List<Pixel> paint(Size parentSize) {
  //   final childCount = children.length;
  //   final List<Pixel> pixelList = [];
  //   int offsetY = 0;
  //   for (int index = 0; index < childCount; index++) {
  //     final child = children[index];
  //     // final childPixelList = child.paint(parentSize).map((pixel) {
  //     //   return pixel.copyWith(
  //     //     offset: pixel.offset.add(
  //     //       Offset(0, offsetY),
  //     //     ),
  //     //   );
  //     // });
  //     // pixelList.addAll(childPixelList);
  //     // offsetY += child.layout(parentSize).height;
  //   }
  //   return pixelList.where((pixel) {
  //     return _position <= pixel.offset.y &&
  //         pixel.offset.y <= _position + parentSize.height;
  //   }).map((pixel) {
  //     return pixel.copyWith(
  //         offset: pixel.offset.add(
  //       Offset(0, -_position),
  //     ));
  //   }).toList();
  // }

  @override
  Size layout(Size parentSize) {
    int height = 0;
    int width = 0;
    final chidrenLength = children.length;
    for (int index = 0; index < chidrenLength; index++) {
      final child = children[index];
      final childSize = child.layout(parentSize);
      if (width < childSize.width) {
        width = childSize.width;
      }
      height += childSize.height;
    }
    return Size(width, height);
  }

  @override
  void paint(Painter painter) {
    final parentSize = painter.parentSize;
    final parentOffset = painter.offset;
    final childCount = children.length;
    int offsetY = 0;
    for (int index = 0; index < childCount; index++) {
      final child = children[index];
      final childOffset = parentOffset.add(Offset(0, offsetY));
      // if (_position <= childOffset.y &&
      //     childOffset.y <= _position + parentSize.height) {
      child.paint(
        Painter(
          parentSize: parentSize,
          offset: childOffset,
        ),
      );
      offsetY += child.layout(parentSize).height;
      // }
    }
    // return pixelList.where((pixel) {
    //   return _position <= pixel.offset.y &&
    //       pixel.offset.y <= _position + parentSize.height;
    // }).map((pixel) {
    //   return pixel.copyWith(
    //       offset: pixel.offset.add(
    //     Offset(0, -_position),
    //   ));
    // }).toList();
  }

  @override
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }
}

// TODO: make [Listenable] and [ChangeNotifier]
class ScrollController {}
