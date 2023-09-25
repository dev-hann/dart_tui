import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

abstract class View extends WidgetOld {
  View() {
    initState();
  }

  void initState() {}

  void update() {
    // Tui.update(() => this);
  }

  @override
  List<Pixel> paint(Size parentSize) {
    return build(parentSize).paint(parentSize);
  }

  WidgetOld build(Size parentSize);
}
