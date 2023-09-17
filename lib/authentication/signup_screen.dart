import 'package:flutter/material.dart';

import '../widgets/logo.dart';
import '../widgets/meta.dart';
import 'creaet_account_button.dart';
import 'custom_app_bar.dart';
import 'email_field.dart';
import 'forgot_password_button.dart';
import 'login_button.dart';
import 'password_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const name = 'signup';
  static const path = '/signup';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Logo(),
              Spacer(),
              EmailField(),
              PasswordField(),
              SizedBox(
                height: 10,
              ),
              LoginButton(),
              Spacer(flex: 2),
              CreaetAccountButton(
                isCreateAccount: false,
              ),
              SizedBox(
                height: 10,
              ),
              Opacity(
                opacity: 0.5,
                child: Meta(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
