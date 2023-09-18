import 'package:animation_class/screens/onboarding/confirmation_code_screen.dart';
import 'package:animation_class/screens/onboarding/interest_screen.dart';
import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isShowPassword = false;
  bool isCompleted = false;
  bool isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Common(
      showLeading: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "You'll need a password",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            "Make sure it's 8 characters or more.",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: _controller,
            obscureText: !isShowPassword,
            onChanged: (value) => {
              if (value.isNotEmpty && value.length >= 8)
                {
                  setState(() {
                    isCompleted = true;
                  }),
                },
            },
            decoration: InputDecoration(
              labelText: "Password",
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Icon(
                      isShowPassword ? FluentIcons.eye_24_filled : FluentIcons.eye_off_24_filled,
                      color: isShowPassword ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (isCompleted)
                    const Icon(
                      FluentIcons.checkmark_circle_24_filled,
                      color: Colors.green,
                      size: 28,
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          NextButton(
            isEnabled: isCompleted,
            onTap: () {
              setState(() {
                isLoading = true;
              });
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InterestScreen(),
                  ),
                );
              });
            },
            isLoading: isLoading,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
