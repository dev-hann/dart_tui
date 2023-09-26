import 'package:dart_tui/src/widget/widget.dart';

abstract class AnimatedWidget extends Widget {
  final AnimatController controller;

  AnimatedWidget({
    required this.controller,
  });
}

class AnimatController {}
