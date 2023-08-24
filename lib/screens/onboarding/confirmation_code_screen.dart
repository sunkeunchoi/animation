import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';

import 'package:flutter/material.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  const ConfirmationCodeScreen({super.key});

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
          const Expanded(
            child: Row(
              children: [],
            ),
          ),
          Text(
            "Didn't receive email?",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blueAccent,
                ),
          ),
          const SizedBox(height: 20),
          const NextButton(
            isEnabled: false,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.isEnabled,
  });
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
          "Next",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: isEnabled ? Colors.white : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
