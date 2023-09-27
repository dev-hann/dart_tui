import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
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
    required Offset parentOffset,
  }) {
    final list = rounded ? roundedEdgeList : sharpEedgeList;
    return [
      Pixel(
        offset: parentOffset + Offset(0, 0),
        char: list[0],
      ),
      Pixel(
        offset: parentOffset + Offset(width, 0),
        char: list[1],
      ),
      Pixel(
        offset: parentOffset + Offset(0, height),
        char: list[2],
      ),
      Pixel(
        offset: parentOffset + Offset(width, height),
        char: list[3],
      ),
    ];
  }

  @override
  Size layout(Size parentSize) {
    return child.layout(parentSize);
  }

  @override
  void paint(Painter painter, Parent parent) {
    final List<Pixel> pixelList = [];
    final childSize = child.layout(parent.size);
    final width = childSize.width + 1;
    final height = childSize.height + 1;
    final parentOffset = parent.offset;
    for (int index = 0; index < width; index++) {
      final topLine = Pixel(
        offset: parentOffset + Offset(index, 0),
        char: "─",
      );
      final bottomLine = Pixel(
        offset: parentOffset + Offset(index, height),
        char: "─",
      );
      pixelList.addAll([topLine, bottomLine]);
    }
    for (int index = 0; index < height; index++) {
      final leftLine = Pixel(
        offset: parentOffset + Offset(0, index),
        char: "│",
      );
      final rigntLine = Pixel(
        offset: parentOffset + Offset(width, index),
        char: "│",
      );
      pixelList.addAll([leftLine, rigntLine]);
    }

    pixelList.addAll(
      edgeList(
        parentOffset: parentOffset,
        width: width,
        height: height,
      ),
    );

    painter.writeList(pixelList);
    child.paint(
      Painter(),
      Parent(
        size: childSize,
        offset: parentOffset + Offset(1, 1),
      ),
    );
  }
}
