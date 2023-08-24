import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              const Text("We sent you a code"),
              const Text("Enter it below to verify"),
              const Text('john.mobbin@gmail.com'),
              const Row(
                children: [],
              ),
              const Text("Didn't receive email?"),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.grey,
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
