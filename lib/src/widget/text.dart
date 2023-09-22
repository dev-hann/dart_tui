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
    for (int index = 0; index < len; index++) {
      final pixel = Pixel(
        offset: Offset(index, 0),
        char: text[index],
      );
      pixelList.add(pixel);
    }
    return pixelList;
  }
}
