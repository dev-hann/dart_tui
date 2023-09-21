import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/widget/center.dart';
import 'package:dart_tui/src/widget/tui_app.dart';

void main() async {
  runTui(
    () => TuiApp(
      child: Center(
        child: Text("Hello World!!"),
      ),
    ),
  );
  await Future.delayed(Duration(minutes: 2));
}
