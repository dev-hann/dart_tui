import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

typedef IndicatorBuilder = String Function(String progressBar, int value);

class ProgressIndicator extends Widget {
  ProgressIndicator(this.value);
  final int value;

  @override
  Size layout(Size parentSize) {
    return Size(parentSize.width, 1);
  }

  @override
  void paint(Painter painter, Parent parent) {
    final size = layout(parent.size);
    final width = size.width;
    final percent = ((value * width) / 100).ceil();
    String progressBar = "";
    for (int index = 0; index < width; index++) {
      if (percent > index) {
        progressBar += "=";
      } else {
        progressBar += "-";
      }
    }
    painter.write(
      Pixel(
        offset: parent.offset,
        char: progressBar,
      ),
    );
  }
}

class CircleIndicator extends Widget {
  CircleIndicator();

  // final _indicatorList = ["◜ ", " ◝", " ◞", "◟ "];
  final _indicatorList = ["\\", "|", "/", "-"];

  @override
  Size layout(Size parentSize) {
    return Size(1, 1);
  }

  @override
  void paint(Painter painter, Parent parent) async {
    int index = 0;
    while (true) {
      final char = _indicatorList[index % _indicatorList.length];
      painter.write(
        Pixel(offset: parent.offset, char: char),
      );
      index++;
      await Future.delayed(
        Duration(milliseconds: 100),
      );
    }
  }
}
