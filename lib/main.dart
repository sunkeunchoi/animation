import 'package:animation_class/screens/nomad_coders/settings/settings_view_model.dart';
import 'package:animation_class/screens/nomad_coders/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/nomad_coders/main_screen.dart';
import 'screens/nomad_coders/settings/settings_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = SettingsRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(repository),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: lightTheme,
      darkTheme: darkTheme,
      // The themeMode is the most important property in showing
      // proper theme. The value comes from ThemeState class.
      themeMode: context.watch<SettingsViewModel>().themeMode,
      home: const MainScreen(),
    );
  }
}
