import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_repository.dart';
import 'signup_form_provider.dart';

class AuthenticationProvider extends AsyncNotifier<void> {
  late final AuthenticationRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(authRepository);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpFormProvider);
    state = await AsyncValue.guard(
      () => _repo.signUp(
        form.email,
        form.password,
      ),
    );
  }
}

final signUpProvider = AsyncNotifierProvider<AuthenticationProvider, void>(
  () => AuthenticationProvider(),
);
