import 'package:animation_class/screens/onboarding/password_screen.dart';
import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:flutter/material.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  bool isCompleted = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Common(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            "We sent you a code",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            "Enter it below to verify",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            'john.mobbin@gmail.com',
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberInput(
                isFirst: true,
                focusNode: focusNode1,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode2.requestFocus();
                  }
                },
              ),
              NumberInput(
                focusNode: focusNode2,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode3.requestFocus();
                  }
                },
              ),
              NumberInput(
                focusNode: focusNode3,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode4.requestFocus();
                  }
                },
              ),
              NumberInput(
                focusNode: focusNode4,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode5.requestFocus();
                  }
                },
              ),
              NumberInput(
                focusNode: focusNode5,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode6.requestFocus();
                  }
                },
              ),
              NumberInput(
                focusNode: focusNode6,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    focusNode6.unfocus();
                    setState(() {
                      isCompleted = true;
                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (isCompleted)
            const Align(
              alignment: Alignment.center,
              child: Icon(
                FluentIcons.checkmark_circle_24_filled,
                color: Colors.green,
                size: 38,
              ),
            ),
          const Spacer(),
          Text(
            "Didn't receive email?",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blueAccent,
                ),
          ),
          const SizedBox(height: 20),
          NextButton(
            isEnabled: isCompleted,
            onTap: () {
              setState(() {
                isLoading = !isLoading;
              });
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PasswordScreen(),
                  ),
                );
              });
            },
            isLoading: isLoading,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class NumberInput extends StatelessWidget {
  const NumberInput({
    super.key,
    required this.focusNode,
    required this.onChanged,
    this.isFirst = false,
  });
  final FocusNode focusNode;
  final Function(String) onChanged;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: SizedBox(
        height: 15 * 5,
        width: 15 * 3,
        child: TextField(
          autofocus: isFirst,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          maxLength: 1,
          showCursor: false,
          textAlign: TextAlign.center,
          enableSuggestions: false,
          autocorrect: false,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
          onChanged: onChanged,
          // onEditingComplete: isLast ? () => FocusScope.of(context).unfocus() : () => context.nextEditableTextFocus(),
          decoration: InputDecoration(
            focusColor: Colors.black,
            counterText: "",
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.isEnabled,
    required this.onTap,
    required this.isLoading,
  });
  final bool isEnabled;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled && !isLoading ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
          color: isEnabled ? Colors.black : Colors.grey.shade600,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 29,
                  width: 29,
                  child: CircularProgressIndicator.adaptive(),
                )
              : Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: isEnabled ? Colors.white : Colors.grey.shade400,
                  ),
                ),
        ),
      ),
    );
  }
}
