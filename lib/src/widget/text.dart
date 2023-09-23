import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Text extends Widget {
  Text(this.text);
  final String text;

  @override
  List<Pixel> paint(Size parentSize) {
    final List<Pixel> pixelList = [];
    final len = text.length;
    Offset offset = Offset.zero;
    for (int index = 0; index < len; index++) {
      String char = text[index];
      if (char == "\n") {
        offset = Offset(0, offset.y + 1);
        continue;
      }
      final pixel = Pixel(
        offset: offset,
        char: char,
      );
      pixelList.add(pixel);
      offset = offset.add(Offset(1, 0));
    }
    return pixelList;
  }
}
