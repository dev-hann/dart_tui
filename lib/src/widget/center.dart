import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';

class Center extends RenderObjectWidget {
  Center({
    required this.child,
  });
  final RenderObjectWidget child;

  @override
  List<Pixel> paint(Size size) {
    final center = size.center;
    final List<Pixel> pixelList = child
        .paint(size)
        .map(
          (e) => e.copyWith(offset: e.offset.add(center)),
        )
        .toList();
    return pixelList;
  }
}
