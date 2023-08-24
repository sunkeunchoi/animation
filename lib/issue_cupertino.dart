import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CupApp());
}

class CupApp extends StatefulWidget {
  const CupApp({super.key});

  @override
  State<CupApp> createState() => _CupAppState();
}

class _CupAppState extends State<CupApp> {
  bool isVisible = false;
  String dateString = "";
  void toggleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cupertino Date Picker"),
        ),
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.white,
          height: isVisible ? MediaQuery.of(context).copyWith().size.height / 3 : 0,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime value) {
              setState(() {
                dateString = value.toString();
              });
            },
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: toggleVisible,
                child: const Text("Open or Close"),
              ),
              Expanded(
                child: Center(
                  child: Text(dateString),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
