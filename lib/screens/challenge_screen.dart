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
  String get todayString => "${weekdayToString.toUpperCase()} ${toLocal().day}";
  List<DateTime> get nextDays => List.generate(5, (i) => add(Duration(days: i + 1)));
}

extension ColorExtension on BuildContext {
  Color bgColor(int index) => switch (index) {
        1 => Theme.of(this).colorScheme.secondaryContainer,
        2 => Theme.of(this).colorScheme.tertiaryContainer,
        _ => Theme.of(this).colorScheme.primaryContainer,
      };
  Color textColor(int index) => switch (index) {
        1 => Theme.of(this).colorScheme.onSecondaryContainer,
        2 => Theme.of(this).colorScheme.onTertiaryContainer,
        _ => Theme.of(this).colorScheme.onPrimaryContainer,
      };
}

const avatarUrl = "https://avatars.githubusercontent.com/u/639005?v=4";

class ChallengeScreen extends StatelessWidget {
  final DateTime now = DateTime.now();
  ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(avatarUrl),
                ),
                Icon(
                  Icons.add_rounded,
                  size: 40,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              now.todayString,
            ),
          ),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TodayHeaderList(now: now),
          ),
          const Divider(color: Colors.transparent),
          Cards(
            colorIdx: 0,
            title: "Design Meeting",
            attendees: const ["Alex", "Helena", "Hana"],
            startAt: DateTime(now.year, now.month, now.day, 11, 30),
            duration: const Duration(minutes: 50),
          ),
          const Divider(color: Colors.transparent),
          Cards(
            colorIdx: 1,
            title: "Daily Project",
            attendees: const ["Richard", "Ciry", "Alex", "Helena", "Hana", "Den"],
            startAt: DateTime(now.year, now.month, now.day, 12, 35),
            duration: const Duration(minutes: 35, hours: 1),
            isAttending: true,
          ),
          const Divider(color: Colors.transparent),
          Cards(
            colorIdx: 2,
            title: "Weekly Planning",
            attendees: const ["Den", "Nana", "Mark"],
            startAt: DateTime(now.year, now.month, now.day, 15, 00),
            duration: const Duration(minutes: 30, hours: 1),
          )
        ],
      ),
    );
  }
}

class TodayHeader extends StatelessWidget {
  final DateTime now;
  const TodayHeader({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Today".toUpperCase(),
        style: TextStyle(
          fontSize: 60,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        children: [
          TextSpan(
            text: " · ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...now.nextDays.map(
            (i) => TextSpan(
              text: "${i.day} ",
            ),
          )
        ],
      ),
    );
  }
}

class TodayHeaderList extends StatelessWidget {
  final DateTime now;
  const TodayHeaderList({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    var list = [
      Text(
        "Today".toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      Text(
        "·",
        style: TextStyle(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      ...now.nextDays.map(
        (i) => Text(
          "${i.day}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    ];
    var result = list.map((e) => [e, const VerticalDivider(color: Colors.transparent)]).expand((element) => element);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        child: Row(
          children: result.toList(),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String title;
  final DateTime startAt;
  final Duration duration;
  final List<String> attendees;
  final bool isAttending;
  final int colorIdx;
  const Cards({
    super.key,
    required this.title,
    required this.attendees,
    required this.startAt,
    required this.duration,
    required this.colorIdx,
    this.isAttending = false,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: context.textColor(colorIdx),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          20,
          35,
          20,
          15,
        ),
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: context.bgColor(colorIdx),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeLine(
                  duration: duration,
                  startAt: startAt,
                ),
                const VerticalDivider(
                  color: Colors.transparent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.split(" ").first.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 60,
                        letterSpacing: -3,
                        height: 1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      title.split(" ").last.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 60,
                        letterSpacing: -3,
                        height: 1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Attendees(
              attendees: attendees,
              isAttending: isAttending,
            ),
          ],
        ),
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  final DateTime startAt;
  final Duration duration;
  const TimeLine({
    super.key,
    required this.startAt,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          startAt.hour.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        Text(
          startAt.minute.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Text(
          "│",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          startAt.add(duration).hour.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        Text(
          startAt.add(duration).minute.toString().padLeft(2, "0"),
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}

class Attendees extends StatelessWidget {
  final int maxAttendees = 3;
  final bool isAttending;
  final List<String> attendees;
  const Attendees({
    super.key,
    required this.attendees,
    required this.isAttending,
  });

  @override
  Widget build(BuildContext context) {
    var temp = isAttending ? ["Me", ...attendees] : attendees;
    var list = temp.length > maxAttendees ? [...temp.take(3), "+${temp.length - maxAttendees}"] : [...temp, ""];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...list.map(
          (e) => Text(
            e.toUpperCase(),
            style: TextStyle(
              fontWeight: e.toUpperCase() == "ME" ? FontWeight.bold : FontWeight.normal,
              color: e.toUpperCase() == "ME"
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : Theme.of(context).colorScheme.surfaceVariant,
            ),
          ),
        )
      ],
    );
  }
}

const ColorScheme themeColors = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffeae1f8),
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
  background: Color(0xff1f1f1f),
  onBackground: Color(0xfff1f1f1),
  surface: Color(0xff1f1f1f),
  onSurface: Color(0xfff1f1f1),
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xffa4337d),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffeae1f8),
);
