import 'dart:async';
import 'dart:io';

import 'package:animation_class/posts/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageService extends AsyncNotifier<void> {
  late final PostRepository _postRepository;
  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepository);
  }

  Future<void> uploadImage(File file) async {
    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(
      () async {
        await _postRepository.uploadImage(file);
        await ref.
      },
    );
  }
}
