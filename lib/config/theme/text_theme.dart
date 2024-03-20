import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
            fontSize: 16.1,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]),
        titleSmall: TextStyle(
            fontSize: 14.8,
            fontWeight: FontWeight.w500,
            color: Colors.blue[300],
            decoration: TextDecoration.underline),
        displayMedium: const TextStyle(
            fontSize: 15.8, fontWeight: FontWeight.w500, color: Colors.black54),
        displaySmall: const TextStyle(
          fontSize: 13.8,
          fontWeight: FontWeight.w500,
        )),
    useMaterial3: true);
