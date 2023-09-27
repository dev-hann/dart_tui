import 'package:dart_tui/src/offset.dart';
import 'package:dart_tui/src/size.dart';

class Parent {
  Parent({
    required this.size,
    this.offset = Offset.zero,
  });
  final Size size;
  final Offset offset;
}
