import 'package:animation_class/authentication/input_field.dart';
import 'package:animation_class/authentication/signup_form_provider.dart';
import 'package:animation_class/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailField extends ConsumerWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputField(
      hintText: S.of(context).login_screen_EmailHint,
      onChanged: (value) {
        ref.read(signUpFormProvider.notifier).updateEmail(value);
      },
    );
  }
}
