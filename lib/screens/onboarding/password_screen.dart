import 'package:animation_class/screens/onboarding/confirmation_code_screen.dart';
import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Common(
      showLeading: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "You'll need a password",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            "Make sure it's 8 characters or more.",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 40),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          const NextButton(
            isEnabled: false,
          ),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
