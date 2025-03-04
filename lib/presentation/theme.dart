import 'package:flutter/material.dart';

/*
− Описание назначения класса
  Описание темы приложения
  
− Дата создания
  03.03.2025
− Автор создания
  Роман Авдеев
- Оценка времени
  120 минут
*/

const Color redColor = Color(0xfff87265);
const Color accentColor = Color(0xff48b2e7);
const Color disableColor = Color(0xff2b6b8b);
const Color subTextLightColor = Color(0xffd8d8d8);
const Color backgroundColor = Color(0xfff7f7f9);
const Color blockColor = Color(0xffffffff);
const Color textColor = Color(0xff2b2b2b);
const Color hintColor = Color(0xff6a6a6a);
const Color subTextDarkColor = Color(0xff707b81);

ThemeData theme = ThemeData(
  primaryColor: accentColor,
  colorScheme: ColorScheme.light(
    // Цветовая схема для светлой темы
    primary: accentColor,
    secondary: accentColor,
    surface: blockColor,
    error: redColor,
    onSurface: textColor,
    brightness: Brightness.light,
  ),
  disabledColor: disableColor,
  hintColor: hintColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: blockColor,
    foregroundColor: textColor,
    titleTextStyle: TextStyle(
      fontFamily: "NEW PENINIM MT",
      color: textColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 128.0,
      fontWeight: FontWeight.w900,
      color: textColor,
    ),
    displayMedium: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 96.0,
      fontWeight: FontWeight.w900,
      color: textColor,
    ),
    displaySmall: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 64.0,
      fontWeight: FontWeight.w800,
      color: textColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 36.0,
      fontWeight: FontWeight.w800,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    titleLarge: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    titleMedium: TextStyle(
      fontFamily: "NEW PENINIM MT",
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
    labelLarge: TextStyle(
      fontFamily: "POPPINS",
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: hintColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "POPPINS",
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: hintColor,
    ),
    labelSmall: TextStyle(
      fontFamily: "POPPINS",
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: hintColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: "POPPINS",
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "POPPINS",
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "POPPINS",
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
  ),
);
