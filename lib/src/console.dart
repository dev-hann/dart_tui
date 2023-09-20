import 'package:dart_tui/src/pixel_data.dart';
import 'package:dart_tui/src/size.dart';

class Console {
  Console({
    required this.size,
  });
  final Size size;
  final List<Pixel> pixelList = [];

  void clear() {
    pixelList.clear();
  }
}
