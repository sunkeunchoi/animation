import 'dart:io';

import 'package:animation_class/posts/post_model.dart';
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
