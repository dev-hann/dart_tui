class Color {
  Color._(this.value);
  final int value;
  factory Color.black() {
    return Color._(0);
  }
  factory Color.red() {
    return Color._(1);
  }
  factory Color.green() {
    return Color._(2);
  }
  factory Color.yellow() {
    return Color._(3);
  }
  factory Color.blue() {
    return Color._(4);
  }
  factory Color.magenta() {
    return Color._(5);
  }
  factory Color.cyan() {
    return Color._(6);
  }
  factory Color.white() {
    return Color._(7);
  }
}

// enum ConsoleColor {
//   /// The named ANSI colors.
//   black('\x1b[30m', '\x1b[40m'),
//   red('\x1b[31m', '\x1b[41m'),
//   green('\x1b[32m', '\x1b[42m'),
//   yellow('\x1b[33m', '\x1b[43m'),
//   blue('\x1b[34m', '\x1b[44m'),
//   magenta('\x1b[35m', '\x1b[45m'),
//   cyan('\x1b[36m', '\x1b[46m'),
//   white('\x1b[37m', '\x1b[47m'),
//   brightBlack('\x1b[90m', '\x1b[100m'),
//   brightRed('\x1b[91m', '\x1b[101m'),
//   brightGreen('\x1b[92m', '\x1b[102m'),
//   brightYellow('\x1b[93m', '\x1b[103'),
//   brightBlue('\x1b[94m', '\x1b[104m'),
//   brightMagenta('\x1b[95m', '\x1b[105m'),
//   brightCyan('\x1b[96m', '\x1b[106m'),
//   brightWhite('\x1b[97m', '\x1b[107m');

//   final String ansiSetForegroundColorSequence;
//   final String ansiSetBackgroundColorSequence;

//   const ConsoleColor(
//       this.ansiSetForegroundColorSequence, this.ansiSetBackgroundColorSequence);
// }
