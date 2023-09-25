import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

const sharpEedgeList = ["┌", "┐", "└", "┘"];
const roundedEdgeList = ["╭", "╮", "╰", "╯"];

class Card extends WidgetOld {
  Card({
    this.width,
    this.height,
    this.rounded = false,
    required this.child,
  });
  final int? width;
  final int? height;
  final WidgetOld child;
  final bool rounded;

  List<Pixel> edgeList({
    required int width,
    required int height,
  }) {
    final list = rounded ? roundedEdgeList : sharpEedgeList;
    return [
      Pixel(
        offset: Offset(0, 0),
        char: list[0],
      ),
      Pixel(
        offset: Offset(width, 0),
        char: list[1],
      ),
      Pixel(
        offset: Offset(0, height),
        char: list[2],
      ),
      Pixel(
        offset: Offset(width, height),
        char: list[3],
      ),
    ];
  }

  @override
  List<Pixel> paint(Size parentSize) {
    final List<Pixel> pixelList = [];
    final width = parentSize.width;
    final height = parentSize.height;
    final childPixelList =
        child.paint(Size(width - 2, height - 2)).map((pixel) {
      return pixel.copyWith(
        offset: pixel.offset.add(Offset(2, 1)),
      );
    });
    pixelList.addAll(childPixelList);
    for (int index = 0; index < width; index++) {
      final topLine = Pixel(
        offset: Offset(index, 0),
        char: "─",
      );
      final bottomLine = Pixel(
        offset: Offset(index, height),
        char: "─",
      );
      pixelList.addAll([topLine, bottomLine]);
    }
    for (int index = 0; index < height; index++) {
      final leftLine = Pixel(
        offset: Offset(0, index),
        char: "│",
      );
      final rigntLine = Pixel(
        offset: Offset(width, index),
        char: "│",
      );
      pixelList.addAll([leftLine, rigntLine]);
    }

    pixelList.addAll(
      edgeList(width: width, height: height),
    );
    return pixelList;
  }
}
