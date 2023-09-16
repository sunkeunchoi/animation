import 'package:animation_class/firebase_options.dart';
import 'package:animation_class/screens/nomad_coders/theme.dart';
import 'package:animation_class/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final preferences = await SharedPreferences.getInstance();
  // final repository = ThemeRepository(preferences);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      overrides: [
        // settingProvider.overrideWith(() => SettingsViewModel(repository)),
      ],
      child: AppView(),
    ),
  );
}

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider),
    );
  }
}
