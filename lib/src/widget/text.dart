import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/size.dart';

class Text extends RenderObjectWidget {
  Text(this.text);
  final String text;

  @override
  List<Pixel> paint(Size size) {
    final List<Pixel> pixelList = [];
    for (int x = 0; x < text.length; x++) {
      final pixel = Pixel(offset: Offset(x, 0), char: text[x]);
      pixelList.add(pixel);
    }
    return pixelList;
  }
}
