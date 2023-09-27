import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

// final _indicator = ["◜ ", " ◝", " ◞", "◟ "];
typedef IndicatorBuilder = String Function(String progressBar, int value);

IndicatorBuilder _defaultBuilder() {
  return (String prorgressBar, int value) {
    return "[$prorgressBar] $value%";
  };
}

class ProgressIndicator extends Widget {
  ProgressIndicator(
    this.value, {
    IndicatorBuilder? builder,
  }) : builder = builder ?? _defaultBuilder();
  final int value;
  final IndicatorBuilder builder;

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
