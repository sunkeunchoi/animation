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
  primaryContainer: Color(0xff716b7e),
  onPrimaryContainer: Color(0xfff1f0f3),
  secondary: Color(0xffece0ff),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xff7561ac),
  onSecondaryContainer: Color(0xfff2effa),
  tertiary: Color(0xffffdbe6),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xff89626f),
  onTertiaryContainer: Color(0xfff5eff1),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff1f1f1f),
  onBackground: Color(0xffededed),
  surface: Color(0xff1f1f1f),
  onSurface: Color(0xffededed),
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xffe1e1e1),
  outline: Color(0xff7a7a7a),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffeae1f8),
);
