import 'package:animation_class/models/users/user_id.dart';

class UserModel {
  final UserId id;
  final String? nickName;
  final String? email;
  final String? profileUrl;
  final int followers;

  UserModel({
    required this.id,
    this.followers = 0,
    this.nickName,
    this.email,
    this.profileUrl,
  });
  factory UserModel.empty() => UserModel(
        id: UserId(""),
        followers: 0,
      );
  factory UserModel.create({
    required String id,
    String? userName,
    String? nickName,
    String? email,
    String? profileUrl,
    int followers = 0,
  }) =>
      UserModel(
        id: UserId(id),
        email: email,
        nickName: nickName,
        profileUrl: profileUrl,
        followers: followers,
      );
  UserModel copyWith({
    String? email,
    String? userName,
    String? nickName,
    String? profileUrl,
    int? followers,
  }) =>
      UserModel(
        id: id,
        email: email ?? this.email,
        nickName: nickName ?? this.nickName,
        profileUrl: profileUrl ?? this.profileUrl,
        followers: followers ?? this.followers,
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickName": nickName,
        "profileUrl": profileUrl,
        "followers": followers,
      };
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: UserId(json["id"]),
        email: json["email"],
        nickName: json["nickName"],
        profileUrl: json["profileUrl"],
        followers: json["followers"],
      );
}
