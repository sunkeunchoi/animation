import 'package:animation_class/screens/challenge_screen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: themeColors,
        useMaterial3: true,
      ),
      home: ChallengeScreen(),
    );
  }
}

const ColorScheme themeColors = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffeae1f8),
  onPrimary: Color(0xff141414),
  primaryContainer: Color(0xfffdf771),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xffece0ff),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xff956dc8),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xffffdbe6),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xffc6ed67),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff1f1f1f),
  onBackground: Color(0xfff1f1f1),
  surface: Color(0xff1f1f1f),
  onSurface: Color(0xfff1f1f1),
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xffa4337d),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffeae1f8),
);
