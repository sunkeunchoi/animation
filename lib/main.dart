import 'package:flutter/material.dart';

import 'screens/menu_screen.dart';
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
      home: const MenuScreen(),
    );
  }
}
