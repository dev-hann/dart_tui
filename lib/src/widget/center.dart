import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Center extends Widget {
  Center({
    required this.child,
  });
  final Widget child;

  @override
  List<Pixel> paint(Size parentSize) {
    final List<Pixel> pixelList = [];
    final center = parentSize.center;
    final childSize = child.layout(parentSize);
    final childPixelList = child.paint(parentSize);
    for (final pixel in childPixelList) {
      final newPixel = pixel.copyWith(
        offset: pixel.offset.add(
          Offset(
            center.x - (childSize.width ~/ 2) + 1,
            center.y - (childSize.height ~/ 2),
          ),
        ),
      );
      pixelList.add(newPixel);
    }
    return pixelList;
  }
}
