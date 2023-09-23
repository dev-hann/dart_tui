class FocusNode {
  FocusNode({
    this.isFocus = false,
  });

  bool isFocus;
  FocusNode? _nextFocusNode;
  FocusNode? _preFocusNode;

  bool get isLast {
    return _nextFocusNode == null;
  }

  bool get isFirst {
    return _preFocusNode == null;
  }

  void add(FocusNode next) {
    _nextFocusNode = next;
  }

  FocusNode nextFocus() {
    if (!isLast) {
      return _nextFocusNode!;
    }
    if (isFirst) {
      return this;
    }
    FocusNode pre = _preFocusNode!;
    while (!pre.isFirst) {
      pre = pre._preFocusNode!;
    }
    return pre;
  }
}
