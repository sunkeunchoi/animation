import 'package:animation_class/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
    this.isCreateAccount = true,
  });
  final bool isCreateAccount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = isCreateAccount
        ? S.of(context).login_screen_CreateNewAccountButton
        : S.of(context).login_screen_AlreadyHaveAccountButton;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          S.of(context).login_screen_LoginButton,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}
