import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  final List<int> minutes = [15, 20, 25, 30, 35];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pomotimer".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: false,
        titleSpacing: 10,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: SizedBox(
              width: 400,
              child: Row(
                children: [
                  const DigitCard(digit: 12),
                  Text(
                    ":",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const DigitCard(digit: 57),
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.tightForFinite(height: 80),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => MinuteButton(
                    minute: minutes[index],
                  )),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: minutes.length,
            ),
          ),
          const Divider(color: Colors.transparent),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surfaceTint,
              minRadius: 50,
              child: const Icon(
                Icons.pause_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          const Divider(color: Colors.transparent),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CountCard(
                label: "Round",
                currentNumber: 1,
                maxNumber: 4,
              ),
              CountCard(
                label: "Goal",
                currentNumber: 0,
                maxNumber: 12,
              ),
            ],
          ),
          const Divider(color: Colors.transparent),
        ],
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  final int maxNumber;
  final int currentNumber;
  final String label;
  const CountCard({
    super.key,
    required this.maxNumber,
    required this.currentNumber,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${currentNumber.toString()}/${maxNumber.toString()}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Divider(color: Colors.transparent),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }
}

class MinuteButton extends StatelessWidget {
  final int minute;
  const MinuteButton({
    super.key,
    required this.minute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: Center(
        child: Text(
          minute.toString().padLeft(2, "0"),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class DigitCard extends StatelessWidget {
  final int digit;
  const DigitCard({
    super.key,
    required this.digit,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Center(
              child: Text(
                "$digit".padLeft(2, "0"),
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const ColorScheme pomodoroThemeColor = ColorScheme(
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
  background: Color(0xffd55846), // Body Backgound
  onBackground: Color(0xfff1f1f1), // Body Text
  surface: Color(0xffd55846), // AppBar Background
  onSurface: Color(0xfff1f1f1), // AppBar TitleText
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xffe4978b),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffb04434),
);
