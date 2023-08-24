import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Common extends StatelessWidget {
  const Common({super.key, required this.child});
  final Widget child;
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
          child: child,
        ),
      ),
    );
  }
}
