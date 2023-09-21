import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/terminal.dart';

void runTui(RenderObjectWidget Function() tuiWidget) {
  Terminal(
    paintBuilder: (terminal) {
      terminal.hideCursor();
      terminal.clearAll();
      final pixelList = tuiWidget().paint(terminal.wiindowSize);
      for (final pixel in pixelList) {
        terminal.write(pixel);
      }
    },
  );
}
