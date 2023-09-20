import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../authentication/authentication_repository.dart';
import '../authentication/login_screen.dart';
import '../authentication/signup_screen.dart';
import '../screens/nomad_coders/main_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: LoginScreen.path,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepository).isLoggedIn;
      // if (!isLoggedIn) {
      //   if (state.path == SignUpScreen.path) {
      //     return null;
      //   }
      //   if (state.path == LoginScreen.path) {
      //     print("Redirecting to null");
      //     return null;
      //   }
      //   print("Redirecting to LoginScreen");
      //   return LoginScreen.path;
      // }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.name,
        path: SignUpScreen.path,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: MainScreen.name,
        path: MainScreen.path,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: LoginScreen.name,
        path: LoginScreen.path,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});
