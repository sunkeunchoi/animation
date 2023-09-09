import 'package:flutter/material.dart';

import '../domain/post.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
  });
  final Post activity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      trailing: null,
      isThreeLine: true,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: activity.type == ActivityType.reply ? 1 : null,
            overflow: activity.type == ActivityType.reply ? TextOverflow.ellipsis : TextOverflow.visible,
            text: TextSpan(
              text: activity.type == ActivityType.mention || activity.type == ActivityType.following
                  ? activity.type.text
                  : activity.message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
              children: [
                if (activity.type == ActivityType.like)
                  TextSpan(
                    text: " ${activity.text}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
              ],
            ),
          ),
          if (activity.type == ActivityType.mention || activity.type == ActivityType.reply)
            Text(
              activity.type == ActivityType.reply ? activity.text ?? "" : activity.message ?? "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
        ],
      ),
      title: Text.rich(
        TextSpan(
          text: "${activity.profileName} ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
          children: [
            TextSpan(
              text:
                  "${activity.minutes > 60 ? activity.minutes ~/ 60 : activity.minutes}${activity.minutes > 60 ? "h" : "m"}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
            ),
          ],
        ),
      ),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(activity.url),
            radius: 28,
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: activity.type.color,
                shape: BoxShape.circle,
                border: Border.all(
                  // No Color Scheme
                  // color: Theme.of(context).colorScheme.surface,
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Icon(
                activity.type.icon,
                // No Color Scheme
                // color: Theme.of(context).colorScheme.surface,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
