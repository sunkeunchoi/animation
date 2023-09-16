import 'package:animation_class/firebase_options.dart';
import 'package:animation_class/screens/nomad_coders/settings/settings_view_model.dart';
import 'package:animation_class/screens/nomad_coders/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/nomad_coders/main_screen.dart';
import 'screens/nomad_coders/settings/settings_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = SettingsRepository(preferences);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
        settingProvider.overrideWith(() => SettingsViewModel(repository)),
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

class AppView extends ConsumerStatefulWidget {
  const AppView({super.key});
  @override
  ConsumerState createState() => _AppViewState();
}

class _AppViewState extends ConsumerState<AppView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(settingProvider).whenOrNull(
          data: (data) => data ? ThemeMode.dark : ThemeMode.light,
          loading: () => ThemeMode.system,
          error: (error, stackTrace) => ThemeMode.system,
        );
    print(theme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme,
      home: const MainScreen(),
    );
  }
}
