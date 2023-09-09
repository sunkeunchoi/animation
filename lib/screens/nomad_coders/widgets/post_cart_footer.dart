import 'package:flutter/material.dart';

class PostCardFooter extends StatelessWidget {
  const PostCardFooter({
    super.key,
    required this.numberOfReplies,
    required this.numberOfLikes,
    required this.followers,
  });
  final int numberOfReplies;
  final int numberOfLikes;
  final List<String> followers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(followers[0]),
                ),
                Positioned(
                  right: 0,
                  top: -14,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(followers[1]),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: -14,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundImage: NetworkImage(followers[2]),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 35,
            child: Text(
              "$numberOfReplies replies · $numberOfLikes likes",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(
                          0.6,
                        ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
