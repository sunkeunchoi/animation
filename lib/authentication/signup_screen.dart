import 'package:animation_class/authentication/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/l10n.dart';
import '../widgets/logo.dart';
import '../widgets/meta.dart';
import 'full_outlined_button.dart';
import 'custom_app_bar.dart';
import 'email_field.dart';
import 'full_primary_button.dart';
import 'password_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const name = 'signup';
  static const path = '/signup';

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
              const CreateAccountButton(),
              const Spacer(flex: 2),
              FullOutlinedButton(
                text: S.of(context).signup_screen_AlreadyHaveAccountButton,
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

class CreateAccountButton extends ConsumerWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(authenticationService.notifier).signUp(context),
      child: FullPrimaryButton(
        text: S.of(context).signup_screen_CreateNewAccountButton,
      ),
    );
  }
}
