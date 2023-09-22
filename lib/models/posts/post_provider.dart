import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post_model.dart';

class PostProvider extends StateNotifier<PostModel> {
  PostProvider() : super(PostModel.empty());
  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateImages(List<File> imagePaths) {
    state = state.copyWith(imagePaths: imagePaths);
  }

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }
}

final postProvider = StateNotifierProvider<PostProvider, PostModel>(
  (ref) => PostProvider(),
);
