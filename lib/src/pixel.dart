// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:equatable/equatable.dart';

import 'package:dart_tui/src/color.dart';
import 'package:dart_tui/src/offset.dart';

class Pixel extends Equatable {
  Pixel({
    required this.offset,
    required this.char,
    this.foreground,
    this.background,
  });
  final Offset offset;
  final String char;
  final Color? foreground;
  final Color? background;

  @override
  List<Object?> get props => [
        offset,
        char,
        foreground,
        background,
      ];

  Pixel copyWith({
    Offset? offset,
    String? char,
    Color? foreground,
    Color? background,
  }) {
    return Pixel(
      offset: offset ?? this.offset,
      char: char ?? this.char,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
    );
  }
}
