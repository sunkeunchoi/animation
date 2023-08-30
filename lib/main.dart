import 'package:animation_class/screens/navigation_theme/home_screen.dart';
import 'package:animation_class/screens/onboarding/confirmation_code_screen.dart';
import 'package:flutter/material.dart';

import 'screens/onboarding/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: onBoardingColors,
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.onSurface,
          unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          selectedIconTheme: const IconThemeData(
            size: 28,
          ),
          unselectedIconTheme: const IconThemeData(
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
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          helperStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
          helperMaxLines: 3,
          suffixIconColor: Colors.green,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (states) => const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
