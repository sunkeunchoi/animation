import 'package:animation_class/authentication/creaet_account_button.dart';
import 'package:animation_class/authentication/custom_app_bar.dart';
import 'package:animation_class/authentication/email_field.dart';
import 'package:animation_class/authentication/forgot_password_button.dart';
import 'package:animation_class/authentication/login_button.dart';
import 'package:animation_class/authentication/password_field.dart';
import 'package:animation_class/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../widgets/meta.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const name = 'login';
  static const path = '/login';

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
              ForgotPasswordButton(),
              Spacer(flex: 2),
              CreaetAccountButton(),
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
