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
