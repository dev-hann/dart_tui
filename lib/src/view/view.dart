import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/parent.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/widget.dart';

abstract class View extends Widget {
  View() {
    initState();
  }

  void initState() {}

  void update() {
    Tui.update(() => this);
  }

  Widget build();

  @override
  Size layout(Size parentSize) {
    return parentSize;
  }

  @override
  void paint(Painter painter, Parent parent) {
    build().paint(painter, parent);
  }
}
