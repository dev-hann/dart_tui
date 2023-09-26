import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/list_view.dart';
import 'package:dart_tui/src/widget/row.dart';
import 'package:dart_tui/src/widget/sized_box.dart';
import 'package:dart_tui/src/widget/widget.dart';

void main() async {
  Tui.runApp(() => MainView());
}

class MainView extends View {
  String a = "Hello";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      a = "World!!!!!!!!!\n Hello";
      update();
    });
  }

  @override
  Widget build() {
    return Card(
      rounded: true,
      child: ListView(
        children: List.generate(100, (index) {
          return Text("$index");
        }),
        // [
        //   Text("!2"),
        //   SizedBox(width: 2),
        //   Text("!2"),
        //   Text("!2sdasdfawej"),
        //   Text("!2"),
        //   Text("!2"),
        // ],
      ),
    );
  }
}
