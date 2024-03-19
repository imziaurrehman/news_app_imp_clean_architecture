import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ),
    useMaterial3: true);
