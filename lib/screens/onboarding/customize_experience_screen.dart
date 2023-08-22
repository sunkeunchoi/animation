import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeExperienceScreen extends StatelessWidget {
  const CustomizeExperienceScreen({super.key, required this.name, required this.email, required this.dob});
  final String name;
  final String email;
  final String dob;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
      ),
      body: const Column(
        children: [
          Text("Customize your experience"),
        ],
      ),
    );
  }
}
