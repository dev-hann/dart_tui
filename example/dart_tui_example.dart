import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/list_view.dart';
import 'package:dart_tui/src/widget/widget.dart';

void main() async {
  Tui.runApp(
    () => Text("Hello"),
  );
}

class MainView extends View {
  @override
  WidgetOld build(Size parentSize) {
    return Card(
      rounded: true,
      child: Column(
        children: [
          TextOld("Hello"),
          TextOld("World!"),
          ListView(
            children: List.generate(20, (index) => TextOld("$index")),
          ),
        ],
      ),
    );
  }
}
