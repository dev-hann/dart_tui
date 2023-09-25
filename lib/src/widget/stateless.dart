import 'package:dart_tui/src/frame_work/build_context.dart';
import 'package:dart_tui/src/frame_work/element.dart';
import 'package:dart_tui/src/widget/widget.dart';

abstract class StatelessWidget extends Widget {
  @override
  StatlessElement createElement() {
    return StatlessElement(this);
  }

  Widget build(BuildContext context);
}
