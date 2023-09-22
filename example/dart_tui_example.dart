import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/size.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/widget.dart';

void main() async {
  Tui.init(
    () => MainView(),
  );
}

class MainView extends View {
  String a = "Hello";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      a = "Hello World!!";
      update();
    });
  }

  @override
  Widget build(Size parentSize) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(a),
          Text(a),
          Text(a),
          Text(a),
          Text(a),
        ],
      ),
    );
  }
}
