import 'package:animation_class/screens/nomad_coders/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../authentication/authentication_repository.dart';
import '../authentication/login_screen.dart';
import '../authentication/signup_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepository).isLoggedIn;
      if (!isLoggedIn) {
        if (state.path != SignUpScreen.path && state.path != LoginScreen.path) {
          return LoginScreen.path;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.name,
        path: SignUpScreen.path,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: HomeScreen.name,
        path: HomeScreen.path,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: LoginScreen.name,
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});
