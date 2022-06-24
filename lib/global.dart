import 'package:flutter/material.dart';

class Global {
  static final colors = _Colors();
  static final ui = _UI();
}

class _Colors {
  final backgroundColor = Color(0XFFF5F7F9);
  final gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0XFFDB7343),
      Color(0XFF3D7695),
    ],
  );
}

class _UI {
  final double cornerRadius = 22;
}
