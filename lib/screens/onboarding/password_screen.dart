import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Common(
      child: Column(
        children: [
          Text("You'll need a password"),
          Text("Make sure it's 8 characters or more."),
        ],
      ),
    );
  }
}
