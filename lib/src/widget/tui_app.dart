import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/size.dart';

class TuiApp extends RenderObjectWidget {
  TuiApp({
    required this.child,
  });
  final RenderObjectWidget child;

  @override
  List<Pixel> paint(Size size) {
    final List<Pixel> pixelList = [...child.paint(size)];
    for (int y = 0; y < size.height; y++) {
      for (int x = 0; x < size.width; x++) {
        final offset = Offset(x, y);
        if (!pixelList.map((e) => e.offset).contains(offset)) {
          final pixel = Pixel(offset: offset, char: " ");
          pixelList.add(pixel);
        }
      }
    }
    return pixelList;
  }
}
