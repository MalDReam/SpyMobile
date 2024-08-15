import 'package:flutter/material.dart';

const Color MAIN_COLOR = Colors.indigo;
const Color SECOND_COLOR = Colors.white;
const Color TIMER_END_COLOR = Colors.red;
const Color TIMER_PAUSE_COLOR = Colors.black12;


ThemeData createLightTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: _createTextTheme(),
    filledButtonTheme: _createOutlinedButtonTheme(),
    appBarTheme: _appBarTheme(),
    dividerTheme: _createDividerThemeData(),
  );
}

TextTheme _createTextTheme() {
  return const TextTheme(headlineMedium: TextStyle());
}

FilledButtonThemeData _createOutlinedButtonTheme() {
  return FilledButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(MAIN_COLOR),
          minimumSize: WidgetStatePropertyAll(Size(100, 50)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ))));
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    backgroundColor: MAIN_COLOR,
    centerTitle: true,
    titleTextStyle: const TextStyle(fontSize: 24),
    actionsIconTheme: const IconThemeData(
      size: 30,
    ),
    iconTheme: const IconThemeData(size: 30, color: SECOND_COLOR),
    shadowColor: MAIN_COLOR,
  );
}

DividerThemeData _createDividerThemeData() {
  return DividerThemeData(color: Colors.indigo[200]);
}
