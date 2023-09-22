import 'dart:async';
import 'dart:io';

import 'package:animation_class/models/users/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/authentication_repository.dart';
import 'user_repository.dart';

class UserProvider extends AsyncNotifier<UserModel> {
  late final UserRepository _repository;
  late final AuthenticationRepository _authRepository;
  // ! build() is similar to Constructor
  @override
  FutureOr<UserModel> build() async {
    _repository = ref.read(userRepository);
    _authRepository = ref.read(authRepository);
    if (_authRepository.isLoggedIn) {
      final profile = await _repository.getProfile(
        _authRepository.user!.uid,
      );
      if (profile != null) {
        return UserModel.fromJson(profile);
      }
    }
    return UserModel.empty();
  }

  Future<void> createProfile(User user) async {
    state = const AsyncValue.loading();
    final profile = UserModel.create(
      id: user.uid,
      nickName: user.displayName,
      email: user.email,
      profileUrl: user.photoURL,
    );
    await _repository.createProfile(profile);
    state = AsyncValue.data(profile);
  }

  Future<void> uploadAvatar(File file) async {
    if (state.value == null) return;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        var profileUrl = await _repository.uploadProfileImage(file, state.value!.id);
        var newState = state.value!.copyWith(profileUrl: profileUrl);
        await _repository.updatePofile(newState);
        return newState;
      },
    );
  }
}

final userProvider = AsyncNotifierProvider<UserProvider, UserModel>(
  () => UserProvider(),
);
