import 'package:animation_class/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const name = 'login';
  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).language,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                letterSpacing: 0,
              ),
        ),
      ),
      body: const SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Logo(),
            ],
          ),
        ),
      ),
    );
  }
}
