import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/list_view.dart';
import 'package:dart_tui/src/widget/widget.dart';

void main() async {
  Tui.runApp(
    () => MainView(),
  );
}

class MainView extends View {
  @override
  Widget build(Size parentSize) {
    return Card(
      rounded: true,
      child: Column(
        children: [
          Text("Hello"),
          Text("World!"),
          ListView(
            children: List.generate(20, (index) => Text("$index")),
          ),
        ],
      ),
    );
  }
}
