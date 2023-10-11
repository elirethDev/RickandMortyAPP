import 'package:flutter/material.dart';

class ThemeConfig {

  ThemeData themeConfig() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
  );

  ThemeData darkThemeConfig() => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.cyan,
    ),
  );
}