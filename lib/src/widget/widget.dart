import 'package:dart_tui/src/color.dart';
import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:meta/meta.dart';

abstract class Widget {
  // This Function for compute Size of Widget [layout()]
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }

  // compute Size of Widget through [dryPaint()]
  Size layout(Size parentSize) {
    int minX = 0, maxX = 0;
    int minY = 0, maxY = 0;
    final dryPaintList = dryPaint(parentSize);
    for (final pixel in dryPaintList) {
      final offset = pixel.offset;
      final x = offset.x;
      final y = offset.y;
      if (x < minX) {
        minX = x;
      }
      if (maxX < x) {
        maxX = x;
      }
      if (y < minY) {
        minY = y;
      }
      if (maxY < y) {
        maxY = y;
      }
    }
    return Size(maxX - minX + 1, maxY - minY + 1);
  }

  @mustCallSuper
  void paint(Painter painter);

  List<Pixel> throwOverflowLayout([String text = ""]) {
    final List<Pixel> pixelList = [];
    final errorTextList = "$runtimeType: overflow layout \n $text"
        .codeUnits
        .map((e) => String.fromCharCode(e))
        .toList();
    for (int index = 0; index < errorTextList.length; index++) {
      final pixel = Pixel(
        offset: Offset(index, 0),
        char: errorTextList[index],
        foreground: Color.red(),
      );
      pixelList.add(pixel);
    }
    return pixelList;
  }
}
