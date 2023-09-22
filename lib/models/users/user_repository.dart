import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_id.dart';
import 'user_model.dart';

final userRepository = Provider((ref) => UserRepository());

class UserRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadProfileImage(File file, UserId userId) async {
    final fileRef = _firebaseStorage.ref().child("avatars/${userId.value}");
    final task = await fileRef.putFile(file);
    return task.ref.getDownloadURL();
  }

  Future<void> updatePofile(UserModel user) async {
    await _firestore.collection('profiles').doc(user.id.value).update(user.toJson());
  }

  Future<void> createProfile(UserModel user) async {
    await _firestore.collection("profiles").doc(user.id.value).set(
          user.toJson(),
        );
  }

  Future<Map<String, dynamic>?> getProfile(String uid) async {
    final doc = await _firestore.collection("profiles").doc(uid).get();
    return doc.data();
  }

  Future<List<Map<String, dynamic>>?> getProfilesByUserName(String userName) async {
    final doc = await _firestore
        .collection("profiles")
        .where("userName", isLessThanOrEqualTo: userName)
        .where("userName", isGreaterThanOrEqualTo: "$userName\uf8ff")
        .get();
    return doc.docs.map((e) => e.data()).toList();
  }
}
