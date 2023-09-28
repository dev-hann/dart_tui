import 'package:dart_tui/dart_tui.dart';
import 'package:dart_tui/src/color.dart';
import 'package:dart_tui/src/view/view.dart';
import 'package:dart_tui/src/widget/sized_box.dart';
import 'package:dart_tui/src/widget/text_style.dart';
import 'package:dart_tui/src/widget/widget.dart';

class Snake extends View {
  @override
  Widget build() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1. Start",
            ),
            Text(
              "2. Rank",
            ),
            Text(
              "3. Exit",
              style: TextStyle(
                foreground: Color.red(),
              ),
            ),
          ],
        ),
      ),
    );
    return Card(
      child: Column(
        children: [
          Text(
            "Score: 0",
            style: TextStyle(
              bold: true,
            ),
          ),
          Row(
            children: [
              Card(
                child: SizedBox(
                  width: 40,
                  height: 20,
                  child: Text("PlayGround"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "1. Start",
                    ),
                    Text(
                      "2. Rank",
                    ),
                    Text(
                      "3. Exit",
                      style: TextStyle(
                        foreground: Color.red(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
