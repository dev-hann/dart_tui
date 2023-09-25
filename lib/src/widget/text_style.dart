class TextStyle {
  const TextStyle({
    this.bold = false,
    this.faint = false,
    this.italic = false,
    this.underscore = false,
    this.blink = false,
    this.inverted = false,
    this.invisible = false,
    this.strikethru = false,
  });
  final bool bold;
  final bool faint;
  final bool italic;
  final bool underscore;
  final bool blink;
  final bool inverted;
  final bool invisible;
  final bool strikethru;

  String styleASCii() {
    final styles = <int>[];
    if (bold) styles.add(1);
    if (faint) styles.add(2);
    if (italic) styles.add(3);
    if (underscore) styles.add(4);
    if (blink) styles.add(5);
    if (inverted) styles.add(7);
    if (invisible) styles.add(8);
    if (strikethru) styles.add(9);
    return '\x1b[${styles.join(";")}m';
  }
}
