import 'package:flutter/material.dart';

final darkTheme = baseTheme.copyWith(
  colorScheme: darkColors,
);
final lightTheme = baseTheme.copyWith(
  colorScheme: lightColors,
);
const ColorScheme lightColors = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff4496e0),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffb4e6ff),
  onPrimaryContainer: Color(0xff0f1314),
  secondary: Color(0xff202b6d),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xff99ccf9),
  onSecondaryContainer: Color(0xff0d1114),
  tertiary: Color(0xff514239),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffbaa99d),
  onTertiaryContainer: Color(0xff100e0d),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  background: Color(0xfff8fbfd),
  onBackground: Color(0xff090909),
  surface: Color(0xfff8fbfd),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xfff1f7fc),
  onSurfaceVariant: Color(0xff121313),
  outline: Color(0xff565656),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xff121518),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffddfeff),
  surfaceTint: Color(0xff4496e0),
);

const ColorScheme darkColors = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffb4e6ff),
  onPrimary: Color(0xff121414),
  primaryContainer: Color(0xff1e8fdb),
  onPrimaryContainer: Color(0xffe4f6ff),
  secondary: Color(0xff99ccf9),
  onSecondary: Color(0xff101414),
  secondaryContainer: Color(0xff202b6d),
  onSecondaryContainer: Color(0xffe4e6f0),
  tertiary: Color(0xffbaa99d),
  onTertiary: Color(0xff121110),
  tertiaryContainer: Color(0xff514239),
  onTertiaryContainer: Color(0xffeceae8),
  error: Color(0xffcf6679),
  onError: Color(0xff140c0d),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfffbe8ec),
  background: Color(0xff1a1d1f),
  onBackground: Color(0xffededed),
  surface: Color(0xff1a1d1f),
  onSurface: Color(0xffededed),
  surfaceVariant: Color(0xff242a2d),
  onSurfaceVariant: Color(0xffdcddde),
  outline: Color(0xffa1a1a1),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xfffafdff),
  onInverseSurface: Color(0xff131314),
  inversePrimary: Color(0xff5c7278),
  surfaceTint: Color(0xffb4e6ff),
);

final baseTheme = ThemeData(
  useMaterial3: true,
  tabBarTheme: const TabBarTheme(
    indicatorColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      size: 28,
    ),
    unselectedIconTheme: IconThemeData(
      size: 28,
    ),
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.5,
    ),
    titleMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.5,
    ),
    bodySmall: TextStyle(
      fontSize: 15,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    helperStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    helperMaxLines: 3,
    focusedBorder: const UnderlineInputBorder(),
    enabledBorder: const UnderlineInputBorder(),
    border: const UnderlineInputBorder(),
    floatingLabelStyle: MaterialStateTextStyle.resolveWith(
      (states) => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
