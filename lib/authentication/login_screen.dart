import 'package:animation_class/authentication/authentication_service.dart';
import 'package:animation_class/authentication/full_outlined_button.dart';
import 'package:animation_class/authentication/custom_app_bar.dart';
import 'package:animation_class/authentication/email_field.dart';
import 'package:animation_class/authentication/forgot_password_button.dart';
import 'package:animation_class/authentication/full_primary_button.dart';
import 'package:animation_class/authentication/password_field.dart';
import 'package:animation_class/authentication/signup_form_provider.dart';
import 'package:animation_class/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              const LoginButton(),
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

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(authenticationService.notifier).signIn(context: context),
      child: FullPrimaryButton(
        text: S.of(context).login_screen_LoginButton,
        isEnabled: ref.watch(signUpFormProvider).canLogin,
      ),
    );
  }
}
