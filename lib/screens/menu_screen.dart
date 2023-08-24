import 'package:animation_class/screens/movies/movies_screen.dart';
import 'package:animation_class/screens/onboarding/confirmation_code_screen.dart';
import 'package:animation_class/screens/onboarding/initial_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  void _goto(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _goto(context, const MoviesScreen());
                },
                child: const Text("Movies"),
              ),
              ElevatedButton(
                onPressed: () {
                  _goto(context, const InitialScreen());
                },
                child: const Text("Onboarding"),
              ),
              ElevatedButton(
                onPressed: () {
                  _goto(context, const ConfirmationCodeScreen());
                },
                child: const Text("Onboarding 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
