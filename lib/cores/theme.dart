import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: const Color(0xfffc3c44));

  static ThemeData theme =
      ThemeData(useMaterial3: true, colorScheme: colorScheme);
  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      colorScheme.outline,
      colorScheme.onBackground,
      colorScheme.outline,
    ],
    stops: const [
      0.1,
      0.3,
      0.4,
    ],
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
