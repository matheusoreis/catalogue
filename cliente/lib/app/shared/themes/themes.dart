import 'package:flutter/material.dart';

import 'colors.dart';

part 'colors_shemes.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: grayColor100,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.only(
      top: 15.0,
      right: 30.0,
      bottom: 15.0,
      left: 30.0,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: errorLightColor,
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: errorLightFocusedColor,
        width: 2.0,
      ),
    ),
    errorStyle: const TextStyle(
      height: 0,
      fontSize: 0,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return lightTextColor;
        },
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          // Cor ao ser desativado
          if (states.contains(MaterialState.disabled)) {
            return primary100;
          }

          // Cor padrão
          return primary500;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return darkTextColor;
        },
      ),
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.only(
      top: 15.0,
      right: 30.0,
      bottom: 15.0,
      left: 30.0,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: errorDarkColor,
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: errorDarkFocusedColor,
        width: 2.0,
      ),
    ),
    errorStyle: const TextStyle(
      height: 0,
      fontSize: 0,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return darkTextColor;
        },
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          // Cor ao ser desativado
          if (states.contains(MaterialState.disabled)) {
            return primary100;
          }

          // Cor padrão
          return primary500;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return darkTextColor;
        },
      ),
    ),
  ),
);
