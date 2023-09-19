import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/v8.dart';

final postRepository = Provider((ref) => PostRepository());

class PostRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UploadTask> uploadImage(File file, UserId userId) async {
    final fileId = const UuidV8().generate();
    final fileRef = _firebaseStorage.ref().child("images/$userId/$fileId");
    return fileRef.putFile(file);
  }

  Future<void> updatePost(PostModel post, UserId userId) async {
    await _firestore.collection('posts').doc(userId.value).update(post.toMap());
  }
}

class UserId {
  final String value;
  UserId(this.value);
  @override
  String toString() => value;
}

class PostModel {
  final String title;
  final String content;
  final String imageUrl;
  final DateTime createdAt;
  final String createdBy;
  final String profileUrl;
  final int likes;
  final int comments;

  PostModel({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.createdAt,
    required this.createdBy,
    required this.profileUrl,
    required this.likes,
    required this.comments,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
    };
  }
}

class UserModel {
  final UserId id;
  UserModel(this.id);
}
