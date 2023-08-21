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
      ),
      home: const MenuScreen(),
    );
  }
}
