import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

ThemeData createLightTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: createTextTheme(),
    filledButtonTheme: createOutlinedButtonTheme(),
  );
}

TextTheme createTextTheme() {
  return const TextTheme(headlineMedium: TextStyle());
}

FilledButtonThemeData createOutlinedButtonTheme() {
  return FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.black),
      minimumSize: WidgetStatePropertyAll(Size(100, 50)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
      )

    )
  );
}
