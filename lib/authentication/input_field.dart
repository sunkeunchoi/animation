import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.isPassword = false,
    this.showPassword = false,
    this.onTap,
  });
  final String hintText;
  final Function(String) onChanged;
  final bool isPassword;
  final bool showPassword;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        autocorrect: false,
        obscureText: isPassword && !showPassword,
        obscuringCharacter: '*',
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    showPassword ? FluentIcons.eye_24_filled : FluentIcons.eye_off_24_filled,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                letterSpacing: 0,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
        ),
      ),
    );
  }
}
