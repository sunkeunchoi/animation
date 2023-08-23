import 'package:animation_class/screens/onboarding/create_account_screen.dart';
import 'package:animation_class/screens/onboarding/svg/apple.dart';
import 'package:animation_class/screens/onboarding/svg/google.dart';
import 'package:animation_class/screens/onboarding/svg/twitter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InitialScreen extends StatelessWidget {
  static const String title = "See what's happening\nin the world right now";
  static const String terms = "By signing up, you agree to our Terms,\nPrivacy Policy, and Cookie Use.";
  static const String alread = "Already have an account? Log in";

  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(
          twitterString,
          height: 30,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SocialButton(social: Social.google),
              const SizedBox(
                height: 20,
              ),
              const SocialButton(social: Social.apple),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ),
                    Text(
                      "   or   ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SocialButton(),
              // RoundButton(
              //   text: "Create account",
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const CreateAccountScreen(),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(height: 25),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    text: "By signing up, you agree to our ",
                    children: [
                      TextSpan(
                        text: "Terms",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const TextSpan(
                        text: ", ",
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const TextSpan(
                        text: ", and ",
                      ),
                      TextSpan(
                        text: "Cookie Use",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -0.5,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                ),
              ),
              const SizedBox(height: 50),
              Flexible(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                  child: const Row(
                    children: [
                      Text("Have a account already? "),
                      Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Social { google, apple, twitter }

extension SocialExtension on Social {
  String get svg => switch (this) {
        Social.google => googleString,
        Social.apple => appleString,
        Social.twitter => twitterString,
      };
  String get text => switch (this) {
        Social.google => "Continue with Google",
        Social.apple => "Continue with Apple",
        Social.twitter => "Continue with Twitter",
      };
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    this.social,
  });
  final Social? social;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: social == null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              );
            }
          : () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: social != null ? Theme.of(context).colorScheme.onSurface.withOpacity(0.4) : Colors.black,
          ),
          borderRadius: BorderRadius.circular(30),
          color: social != null ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Text(
                social == null ? "Create account" : social!.text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: social != null
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
            if (social != null)
              Positioned(
                left: 50,
                top: -4,
                child: SvgPicture.string(
                  social!.svg,
                  height: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.text,
    this.background = Colors.black,
    this.textColor = Colors.white,
    required this.onPressed,
  });
  final String text;
  final Color background;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const ColorScheme onBoardingColors = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff6096e3),
  onPrimary: Color(0xff141414),
  primaryContainer: Color(0xfffdf771),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xffece0ff),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xff956dc8),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xffffdbe6),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xffc6ed67),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xffffffff),
  onBackground: Color(0xff1f1f1f),
  surface: Color(0xffffffff),
  onSurface: Color(0xff1f1f1f),
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xffa4337d),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff141414),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffeae1f8),
);
