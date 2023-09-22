import 'dart:async';

import 'package:animation_class/authentication/authentication_repository.dart';
import 'package:animation_class/posts/post_model.dart';
import 'package:animation_class/posts/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostService extends AsyncNotifier<void> {
  late final PostRepository _postRepository;
  @override
  FutureOr<void> build() {
    _postRepository = ref.read(postRepository);
  }

  Future<void> uploadPost({required PostModel post}) async {
    state = const AsyncValue.loading();
    final userId = ref.read(authRepository).user!.uid;
    state = await AsyncValue.guard(
      () async {
        if (post.imagePaths.isEmpty) {
          await _postRepository.uploadPost(
            post.copyWith(
              createdBy: userId,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
          return;
        } else {
          final imageUrls = <String>[];
          for (final file in post.imagePaths) {
            final url = await _postRepository.uploadImage(file, userId);
            imageUrls.add(url);
          }
          await _postRepository.uploadPost(
            post.copyWith(
              imageUrls: imageUrls,
              createdBy: userId,
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      },
    );
    state = const AsyncValue.data(null);
  }
}

final postService = AsyncNotifierProvider<PostService, void>(
  () => PostService(),
);
