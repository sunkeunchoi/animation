import 'package:animation_class/authentication/full_outlined_button.dart';
import 'package:animation_class/authentication/custom_app_bar.dart';
import 'package:animation_class/authentication/email_field.dart';
import 'package:animation_class/authentication/forgot_password_button.dart';
import 'package:animation_class/authentication/full_primary_button.dart';
import 'package:animation_class/authentication/password_field.dart';
import 'package:animation_class/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../widgets/meta.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const name = 'login';
  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Logo(),
              const Spacer(),
              const EmailField(),
              const PasswordField(),
              const SizedBox(
                height: 10,
              ),
              FullPrimaryButton(
                text: S.of(context).login_screen_LoginButton,
              ),
              const ForgotPasswordButton(),
              const Spacer(flex: 2),
              FullOutlinedButton(
                text: S.of(context).signup_screen_CreateNewAccountButton,
              ),
              const SizedBox(
                height: 10,
              ),
              const Opacity(
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
