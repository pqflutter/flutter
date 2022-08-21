import 'dart:math' show Random;

import 'package:flutter/material.dart' show Color;

export 'routes.dart';
export 'root_page.dart';

export 'animation/animated_container_page.dart';

/// 随机颜色
Color random() {
  final random = Random();
  int r = random.nextInt(155) + 100;
  int g = random.nextInt(155) + 100;
  int b = random.nextInt(155) + 100;
  return Color.fromARGB(255, r, g, b);
}