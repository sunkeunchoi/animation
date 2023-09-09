import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Post {
  final String url;
  final ActivityType type;
  final String profileName;
  final num minutes;
  final String? message;
  final String? text;

  Post({
    required this.url,
    required this.type,
    required this.profileName,
    required this.minutes,
    this.message,
    this.text,
  });
}

enum ActivityType {
  mention,
  reply,
  following,
  like,
}

extension ActivityIcon on ActivityType {
  IconData get icon {
    switch (this) {
      case ActivityType.mention:
        return FluentIcons.mention_24_filled;
      case ActivityType.reply:
        return FluentIcons.arrow_reply_24_filled;
      case ActivityType.following:
        return FluentIcons.person_24_filled;
      case ActivityType.like:
        return FluentIcons.heart_24_filled;
    }
  }

  Color get color {
    switch (this) {
      case ActivityType.mention:
        return Colors.green.shade400;
      case ActivityType.reply:
        return Colors.lightBlueAccent;
      case ActivityType.following:
        return Colors.deepPurple.shade500;
      case ActivityType.like:
        return Colors.pink;
    }
  }

  String get text {
    switch (this) {
      case ActivityType.mention:
        return "Mentioned you";
      case ActivityType.reply:
        return "";
      case ActivityType.following:
        return "Followed you";
      case ActivityType.like:
        return "";
    }
  }
}
