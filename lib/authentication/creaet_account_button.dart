import 'package:animation_class/authentication/signup_screen.dart';
import 'package:animation_class/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreaetAccountButton extends StatelessWidget {
  const CreaetAccountButton({
    super.key,
    this.isCreateAccount = true,
  });
  final bool isCreateAccount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.goNamed(SignUpScreen.name);
        if (isCreateAccount) {
          context.pushNamed(SignUpScreen.name);
        } else {
          context.pop();
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          isCreateAccount
              ? S.of(context).login_screen_CreateNewAccountButton
              : S.of(context).login_screen_AlreadyHaveAccountButton,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
