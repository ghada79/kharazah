import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Shader createCircularPattern(Rect bounds) {
  return RadialGradient(
    tileMode: TileMode.repeated,
    colors: [Colors.purple.withOpacity(0.3), Colors.transparent],
    radius: 0.1,
    stops: [0.0, 1.0],
    center: Alignment.topLeft,
  ).createShader(bounds);
}
