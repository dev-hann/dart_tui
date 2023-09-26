import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/text_style.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Text extends Widget {
  Text(
    this.text, {
    this.style = const TextStyle(),
  });
  final String text;
  final TextStyle style;

  @override
  List<Pixel> dryPaint(Size parentSize) {
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

  @override
  void paint(Painter painter) {
    painter.writeList(dryPaint(painter.parentSize));
  }
}
