import 'package:animation_class/screens/onboarding/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Common(
      child: Column(
        children: [
          const Text("What do you want to see on Twitter?"),
          const Text(
            "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
