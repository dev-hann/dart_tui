import 'package:dart_tui/src/widget/widget.dart';

abstract class AlignWidget extends Widget {
  AlignWidget({
    required this.child,
  });
  final Widget child;
}
