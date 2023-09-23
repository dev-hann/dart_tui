import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

enum Axis {
  horizontal,
  vertical,
}

class ListView extends Widget {
  ListView({
    super.focusNode,
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
  List<Pixel> paint(Size parentSize) {
    final childCount = children.length;
    final List<Pixel> pixelList = [];
    int offsetY = 0;
    for (int index = 0; index < childCount; index++) {
      final child = children[index];
      final childPixelList = child.paint(parentSize).map((pixel) {
        return pixel.copyWith(
          offset: pixel.offset.add(
            Offset(0, offsetY),
          ),
        );
      });
      pixelList.addAll(childPixelList);
      offsetY += child.layout(parentSize).height;
    }
    return pixelList.where((pixel) {
      return _position <= pixel.offset.y &&
          pixel.offset.y <= _position + parentSize.height;
    }).map((pixel) {
      return pixel.copyWith(
          offset: pixel.offset.add(
        Offset(0, -_position),
      ));
    }).toList();
  }
}

// TODO: make [Listenable] and [ChangeNotifier]
class ScrollController {}
