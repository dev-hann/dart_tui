import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
  baseline,
}

enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

class Column extends Widget {
  Column({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  @override
  List<Pixel> paint(Size parentSize) {
    final height = parentSize.height;
    final List<Pixel> pixelList = [];
    final List<List<Pixel>> childrenPixelList =
        children.map((e) => e.paint(parentSize)).toList();
    final childrenPixelListLength = childrenPixelList.length;
    // if (height < children.map((e) => e.layout(parentSize).height).reduce((value, element) => null)) {
    //   return throwOverflowLayout("");
    // }

    switch (mainAxisAlignment) {
      case MainAxisAlignment.start:
        for (int index = 0; index < childrenPixelListLength; index++) {
          final childPixelList = childrenPixelList[index].map((pixel) {
            return pixel.copyWith(offset: pixel.offset.add(Offset(0, index)));
          });
          pixelList.addAll(childPixelList);
        }
        break;
      case MainAxisAlignment.end:
        for (int index = 1; index < childrenPixelListLength + 1; index++) {
          final childPixelList =
              childrenPixelList[childrenPixelListLength - index].map((pixel) {
            return pixel.copyWith(
              offset: pixel.offset.add(Offset(0, height - index)),
            );
          });
          pixelList.addAll(childPixelList);
        }
        break;
      case MainAxisAlignment.center:
        for (int index = 0; index < childrenPixelListLength; index++) {
          final childPixelList = childrenPixelList[index].map(
            (pixel) {
              return pixel.copyWith(
                offset: pixel.offset.add(
                  Offset(
                    0,
                    index + (height ~/ 2) - (childrenPixelListLength ~/ 2),
                  ),
                ),
              );
            },
          );
          pixelList.addAll(childPixelList);
        }
        break;
      case MainAxisAlignment.spaceBetween:
        break;
      case MainAxisAlignment.spaceAround:
        break;
      case MainAxisAlignment.spaceEvenly:
        break;
    }

    return pixelList;
  }
}
