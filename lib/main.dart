import 'package:animation_class/screens/nomad_coders/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/nomad_coders/application/theme_cubit.dart';
import 'screens/nomad_coders/application/theme_repository.dart';
import 'screens/nomad_coders/main_screen.dart';

void main() async {
  // required when using any plugin. In our case, it's shared_preferences
  WidgetsFlutterBinding.ensureInitialized();

  // Creating an instance of ThemeRepository that will invoke the `_init()` method
  // and populate the stream controller in the repository.
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  runApp(App(themeRepository: themeRepository));
}

class App extends StatelessWidget {
  const App({super.key, required this.themeRepository});
  final ThemeRepository themeRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: themeRepository,
      child: BlocProvider(
        create: (context) => ThemeCubit(
          themeRepository: context.read<ThemeRepository>(),
        )..getCurrentTheme(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Animations',
          theme: lightTheme,
          darkTheme: darkTheme,
          // The themeMode is the most important property in showing
          // proper theme. The value comes from ThemeState class.
          themeMode: state.themeMode,
          home: const MainScreen(),
        );
      },
    );
  }
}
