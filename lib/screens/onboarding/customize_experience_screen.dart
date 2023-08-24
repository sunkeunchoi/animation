import 'package:animation_class/screens/onboarding/create_account_screen.dart';
import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key, required this.name, required this.email, required this.dob});
  final String name;
  final String email;
  final String dob;

  @override
  State<CustomizeExperienceScreen> createState() => _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
        leading: const Icon(
          FluentIcons.arrow_left_24_regular,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Text(
                "Customize your experience",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Track where you see Twitter contexnt across the web",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Switch.adaptive(
                    value: isSelected,
                    onChanged: (newValue) {
                      isSelected = newValue;
                      setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text.rich(
                TextSpan(
                  text: "By signing up, you agree to our ",
                  children: [
                    TextSpan(
                      text: "Terms",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(text: ", "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(text: ", and "),
                    TextSpan(
                      text: "Cookie Use",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextSpan(
                      text:
                          ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                    ),
                    TextSpan(
                      text: "Learn more",
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: -1,
                ),
              ),
              const Expanded(
                child: SizedBox(height: 20),
              ),
              GestureDetector(
                onTap: isSelected
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen(
                              name: widget.name,
                              email: widget.email,
                              dob: widget.dob,
                              isAgreed: true,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.grey.shade500,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
