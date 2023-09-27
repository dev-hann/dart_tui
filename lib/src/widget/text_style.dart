import 'package:dart_tui/src/color.dart';
import 'package:dart_tui/src/pixel.dart';

enum TextOverflow {
  clip,
  ellipsis,
}

class TextStyle extends PixelStyle {
  const TextStyle({
    this.maxLine,
    this.overflow = TextOverflow.clip,
    super.bold = false,
    super.faint = false,
    super.italic = false,
    super.underscore = false,
    super.blink = false,
    super.inverted = false,
    super.invisible = false,
    super.strikethru = false,
    super.foreground = const Color.white(),
    super.background = const Color.black(),
  });
  final int? maxLine;
  final TextOverflow overflow;
}
