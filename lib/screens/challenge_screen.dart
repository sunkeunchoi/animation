import 'package:flutter/material.dart';

extension DateTimeToString on DateTime {
  String get weekdayToString => switch (toLocal().weekday) {
        DateTime.sunday => "Sunday",
        DateTime.saturday => "Saturday",
        DateTime.friday => "Friday",
        DateTime.thursday => "Thursday",
        DateTime.wednesday => "Wednesday",
        DateTime.tuesday => "Tuesday",
        DateTime.monday => "Monday",
        _ => "Unknwon"
      };
  String get todayToString => "$weekdayToString ${toLocal().day}";
}

class ChallengeScreen extends StatelessWidget {
  final DateTime today = DateTime.now();
  ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    foregroundImage: NetworkImage("https://avatars.githubusercontent.com/u/639005?v=4"),
                  ),
                  IconButton(
                    iconSize: 28,
                    onPressed: () {},
                    icon: const Icon(Icons.add_rounded),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    today.todayToString,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
