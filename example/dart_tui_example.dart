import 'dart:async';

import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/progress_indicator.dart';
import 'package:dart_tui/src/widget/sized_box.dart';
import 'package:dart_tui/src/widget/text_style.dart';
import 'package:dart_tui/src/widget/widget.dart';

void main() async {
  // Tui.runApp(() => Snake());
  Tui.runApp(() => MainView());
}

class MainView extends View {
  int value = 0;
  @override
  void initState() {
    super.initState();
    Timer? _timer;
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (value == 100) {
        _timer?.cancel();
        return;
      }
      value++;
      update();
    });
  }

  @override
  Widget build() {
    return SizedBox(
      width: 100,
      child: ProgressIndicator(value),
    );
  }
}
