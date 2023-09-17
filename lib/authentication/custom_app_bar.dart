import 'package:animation_class/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      title: Text(
        S.of(context).language,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              letterSpacing: 0,
            ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
