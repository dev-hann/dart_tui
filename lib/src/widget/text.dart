import 'package:dart_tui/src/frame_work/element.dart';
import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/pixel.dart';
import 'package:dart_tui/src/render_object/render_object.dart';
import 'package:dart_tui/src/render_object/render_object_widget.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/widget/text_style.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Text extends RenderObjectWidget {
  Text(
    this.data, {
    this.style = const TextStyle(),
  });
  final String data;
  final TextStyle style;

  @override
  RenderObject createRenderObject() {
    return TextRenderObject(
      data,
      style: style,
    );
  }

  @override
  void updateRenderObject(TextRenderObject renderObject) {
    renderObject
      ..data = data
      ..style = style;
  }

  @override
  Element createElement() => TextElement(this);
}

class TextElement extends Element {
  TextElement(super.widget);
}

class TextRenderObject extends RenderObject {
  TextRenderObject(
    String data, {
    required TextStyle style,
  })  : _data = data,
        _style = style;
  String _data = "";
  String get data => _data;
  set data(String value) {
    _data = value;
  }

  TextStyle _style;
  TextStyle get style => _style;
  set style(TextStyle value) {
    _style = value;
  }

  @override
  void paint(Painter painter, Offset offset) {
    Offset textOffset = offset;
    for (final char in data.split('')) {
      if (char == "\n") {
        textOffset = Offset(0, textOffset.y + 1);
        continue;
      }
      final pixel = Pixel(
        offset: textOffset,
        char: char,
      );
      painter.drawPixel(pixel);
      textOffset = textOffset.add(Offset(1, 0));
    }
  }
}

class TextOld extends WidgetOld {
  TextOld(
    this.text, {
    this.style = const TextStyle(),
  });
  final String text;
  final TextStyle style;

  @override
  List<Pixel> paint(Size parentSize) {
    final List<Pixel> pixelList = [];
    final len = text.length;
    Offset offset = Offset.zero;
    for (int index = 0; index < len; index++) {
      String char = text[index];
      if (char == "\n") {
        offset = Offset(0, offset.y + 1);
        continue;
      }
      final pixel = Pixel(
        offset: offset,
        char: char,
      );
      pixelList.add(pixel);
      offset = offset.add(Offset(1, 0));
    }
    return pixelList;
  }
}
