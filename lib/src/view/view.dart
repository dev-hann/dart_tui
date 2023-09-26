import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/painter.dart';
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
  void paint(Painter painter) {
    build().paint(painter);
  }
}
