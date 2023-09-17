import 'package:animation_class/screens/nomad_coders/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../authentication/authentication_repository.dart';
import '../authentication/login_screen.dart';
import '../authentication/signup_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: LoginScreen.path,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepository).isLoggedIn;
      if (!isLoggedIn) {
        // print(state.path);
        // print(state.name);
        // if (state.path == SignUpScreen.path) {
        //   return null;
        // }
        // if (state.path == LoginScreen.path) {
        //   print("Redirecting to null");
        //   return null;
        // }
        // print("Redirecting to LoginScreen");
        // return LoginScreen.path;
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
