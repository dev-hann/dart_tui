import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

const sharpEedgeList = ["┌", "┐", "└", "┘"];
const roundedEdgeList = ["╭", "╮", "╰", "╯"];

class Card extends Widget {
  Card({
    this.width,
    this.height,
    this.rounded = false,
    required this.child,
  });
  final int? width;
  final int? height;
  final Widget child;
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
  Size layout(Size parentSize) {
    return child.layout(parentSize);
  }

  @override
  void paint(Painter painter) {
    final List<Pixel> pixelList = [];
    final childSize = child.layout(painter.parentSize);
    final width = childSize.width + 1;
    final height = childSize.height + 1;
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
    painter.writeList(pixelList);
    child.paint(
      Painter(
        parentSize: Size(width, height),
        offset: Offset(1, 1),
      ),
    );
  }

  @override
  List<Pixel> dryPaint(Size parentSize) {
    return [];
  }
}
