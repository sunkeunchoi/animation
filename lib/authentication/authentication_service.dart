import 'dart:async';
import 'dart:developer';

import 'package:animation_class/authentication/login_screen.dart';
import 'package:animation_class/screens/nomad_coders/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'authentication_repository.dart';
import 'signup_form_provider.dart';

void showFirebaseErrorSnack(
  BuildContext context,
  FirebaseException? exception,
) {
  final snack = SnackBar(
    showCloseIcon: true,
    closeIconColor: Theme.of(context).colorScheme.onErrorContainer,
    backgroundColor: Theme.of(context).colorScheme.errorContainer,
    content: Text(
      exception?.message ?? "Something wen't wrong",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}

class AuthenticateService extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepository);
  }

  Future<void> signIn({
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpFormProvider);
    state = await AsyncValue.guard(() async {
      _authRepo.signIn(form.email, form.password);
    });
    if (state.hasError) {
      log("${state.error}");
      showFirebaseErrorSnack(context, state.error as FirebaseException);
    } else {
      context.goNamed(MainScreen.name);
    }
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpFormProvider);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.signUp(
        form.email,
        form.password,
      );
      // TODO: Create usersRepository
      // final users = ref.read(usersProvider.notifier);
      // users.createProfile(userCredential.user!);
    });

    if (state.hasError) {
      log("${state.error}");
      showFirebaseErrorSnack(context, state.error as FirebaseException);
    } else {
      context.goNamed(MainScreen.name);
    }
  }

  Future<void> signOut(BuildContext context) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepo.signOut();
    });

    if (state.hasError) {
      log("${state.error}");
      showFirebaseErrorSnack(context, state.error as FirebaseException);
    } else {
      context.goNamed(LoginScreen.name);
    }
  }
}

final authenticationService = AsyncNotifierProvider<AuthenticateService, void>(
  () => AuthenticateService(),
);
