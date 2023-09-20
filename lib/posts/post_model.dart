import 'dart:io';

import 'package:animation_class/posts/post_id.dart';

class PostModel {
  final PostId id;
  final String title;
  final String content;
  final String? imageUrls;
  final List<File> imagePaths;
  final String? thumbnailUrls;
  final int createdAt;
  final String createdBy;
  final String? profileUrl;
  final int likes;
  final int comments;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.createdBy,
    this.thumbnailUrls,
    this.imageUrls,
    this.profileUrl,
    this.imagePaths = const [],
    this.likes = 0,
    this.comments = 0,
  });
  get isValid => title.isNotEmpty && content.isNotEmpty;

  factory PostModel.empty() => PostModel(
        id: PostId.create(),
        title: "",
        content: "",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        createdBy: "",
      );
  PostModel copyWith({
    String? title,
    String? content,
    List<String>? imageUrls,
    List<String>? thumbnailUrls,
    List<File>? imagePaths,
    int? createdAt,
    String? createdBy,
    String? profileUrl,
    int? likes,
    int? comments,
  }) =>
      PostModel(
        id: id,
        title: title ?? this.title,
        content: content ?? this.content,
        imageUrls: imageUrls?.join(",") ?? this.imageUrls,
        thumbnailUrls: thumbnailUrls?.join(",") ?? this.thumbnailUrls,
        imagePaths: imagePaths ?? this.imagePaths,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        profileUrl: profileUrl,
        likes: likes ?? this.likes,
        comments: comments ?? this.comments,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrls': imageUrls,
      'thumbnailUrls': thumbnailUrls,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'profileUrl': profileUrl,
      'likes': likes,
      'comments': comments,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: PostId(json['id']),
      title: json['title'],
      content: json['content'],
      imageUrls: json['imageUrls']?.split(",") ?? [],
      thumbnailUrls: json['thumbnailUrls']?.split(",") ?? [],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      profileUrl: json['profileUrl'],
      likes: json['likes'],
      comments: json['comments'],
    );
  }
}
