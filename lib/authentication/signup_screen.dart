import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const name = 'signup';
  static const path = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: const SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              Text("SignUp"),
            ],
          ),
        ),
      ),
    );
  }
}
