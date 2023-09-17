import 'package:animation_class/authentication/input_field.dart';
import 'package:animation_class/authentication/login_screen.dart';
import 'package:animation_class/authentication/signup_form_provider.dart';
import 'package:animation_class/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputField(
      isPassword: true,
      showPassword: ref.watch(signUpFormProvider).showPassword,
      onTap: ref.read(signUpFormProvider.notifier).toggleShowPassword,
      hintText: S.of(context).login_screen_PasswordHint,
      onChanged: (value) {
        ref.read(signUpFormProvider.notifier).updatePassword(value);
      },
    );
  }
}
