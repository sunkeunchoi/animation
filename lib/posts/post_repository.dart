import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/v8.dart';

final postRepository = Provider((ref) => PostRepository());

class PostRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadImage(File file, String createdBy) async {
    final fileId = const UuidV8().generate();
    final fileRef = _firebaseStorage.ref().child("images/$createdBy/$fileId");
    return fileRef.putFile(file).storage.ref().getDownloadURL();
  }

  Future<void> uploadPost(PostModel post) async {
    await _firestore.collection('posts').doc(post.createdBy).update(post.toJson());
  }
}

class UserId {
  final String value;
  UserId(this.value);
  @override
  String toString() => value;
}

class PostId {
  final String value;
  PostId(this.value);
  factory PostId.create() => PostId(const UuidV8().generate());
  @override
  String toString() => value;
}

class PostModel {
  final PostId id;
  final String title;
  final String content;
  final String imageUrls;
  final String thumbnailUrls;
  final int createdAt;
  final String createdBy;
  final String? profileUrl;
  final int likes;
  final int comments;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrls,
    required this.thumbnailUrls,
    required this.createdAt,
    required this.createdBy,
    this.profileUrl,
    required this.likes,
    required this.comments,
  });
  factory PostModel.create(
    UserModel user,
    String title,
    String content,
  ) =>
      PostModel(
        id: PostId.create(),
        title: title,
        content: content,
        imageUrls: "",
        thumbnailUrls: "",
        createdAt: DateTime.now().millisecondsSinceEpoch,
        createdBy: user.id.value,
        profileUrl: user.profileUrl,
        likes: 0,
        comments: 0,
      );
  PostModel copyWith({
    String? title,
    String? content,
    List<String>? imageUrls,
    List<String>? thumbnailUrls,
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
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        profileUrl: profileUrl ?? this.profileUrl,
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

class UserModel {
  final UserId id;
  final String? profileUrl;
  UserModel({required this.id, this.profileUrl});
}
