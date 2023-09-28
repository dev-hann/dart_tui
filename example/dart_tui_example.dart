import 'dart:async';
import 'dart:io';

import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/painter.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/widget.dart';

import 'snake/snake.dart';

void main() async {
  Tui.runApp(() => Snake());

  // Tui.runApp(() => MainView());
}

class MainView extends View {
  @override
  Widget build() {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(1, 2, 3, 4),
        child: Text("2"),
      ),
    );
  }
}
