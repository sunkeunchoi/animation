import 'package:animation_class/firebase_options.dart';
import 'package:animation_class/screens/nomad_coders/theme.dart';
import 'package:animation_class/theme/theme_repository.dart';
import 'package:animation_class/theme/theme_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/nomad_coders/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeRepository(preferences);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      overrides: [
        // settingProvider.overrideWith(() => SettingsViewModel(repository)),
      ],
      child: App(),
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

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider),
      home: const MainScreen(),
    );
  }
}
