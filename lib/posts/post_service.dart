import 'dart:async';
import 'dart:io';

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
    state = await AsyncValue.guard(
      () async {
        await _postRepository.uploadPost(
          post,
        );
      },
    );
    state = const AsyncValue.data(null);
  }

  Future<void> uploadPostWithImages({
    required PostModel post,
    required List<File> images,
  }) async {
    state = const AsyncValue.loading();
    final imageUrls = <String>[];
    state = await AsyncValue.guard(
      () async {
        for (final file in images) {
          final url = await _postRepository.uploadImage(file, post.createdBy);
          imageUrls.add(url);
        }
        await _postRepository.uploadPost(
          post.copyWith(
            imageUrls: imageUrls,
          ),
        );
      },
    );
    state = const AsyncValue.data(null);
  }
}

final postService = AsyncNotifierProvider<PostService, void>(
  () => PostService(),
);
