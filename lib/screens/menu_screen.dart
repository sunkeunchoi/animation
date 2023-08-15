import 'package:flutter/material.dart';

import 'implicit_animations_screen.dart';

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
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: CircleAvatar(
              foregroundImage: NetworkImage("https://avatars.githubusercontent.com/u/639005?v=4"),
            ),
          ),
          actions: [
            IconButton(
              iconSize: 28,
              onPressed: () {},
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _goto(context, const ImplicitAnimationsScreen());
                },
                child: const Text("Implicit Animations"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
