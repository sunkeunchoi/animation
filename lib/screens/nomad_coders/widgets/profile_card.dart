import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.url,
    required this.profileName,
    required this.userName,
    required this.followers,
  });

  final String url;
  final String profileName;
  final String userName;
  final num followers;

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.compact(locale: "en_US");
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Row(
        children: [
          Text(
            profileName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            FluentIcons.checkmark_starburst_24_filled,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      subtitle: Text.rich(
        TextSpan(
          text: "$userName\n",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          children: [
            TextSpan(
              text: "${f.format(followers)} followers",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: Text(
          "Follow",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
