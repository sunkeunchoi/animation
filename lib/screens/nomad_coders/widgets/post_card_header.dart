import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PostCardHeader extends StatelessWidget {
  const PostCardHeader({
    super.key,
    required this.profile,
    required this.user,
    required this.minutes,
    required this.text,
    required this.isTextOnly,
  });
  final String profile;
  final String user;
  final String minutes;
  final String text;
  final bool isTextOnly;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(profile),
              ),
              Positioned(
                bottom: -6,
                right: -6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: 3,
                    ),
                  ),
                  child: Icon(
                    FluentIcons.add_24_filled,
                    color: Theme.of(context).colorScheme.surface,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    user,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    FluentIcons.checkmark_starburst_24_filled,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Spacer(),
                  Text(
                    minutes,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(
                            0.5,
                          ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const MoreBottomSheet();
                        },
                        showDragHandle: true,
                        barrierColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                              0.8,
                            ),
                      );
                    },
                    child: Icon(
                      FluentIcons.more_horizontal_24_filled,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                text,
                maxLines: isTextOnly ? null : 1,
                overflow: isTextOnly ? null : TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MoreBottomSheet extends StatelessWidget {
  const MoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              ListTile(
                style: ListTileStyle.list,
                tileColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                title: Text(
                  "Unfollow",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                height: 0,
              ),
              ListTile(
                tileColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                title: Text(
                  "Mute",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                tileColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                title: Text(
                  "Hide",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                height: 0,
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ReportSheet();
                    },
                    showDragHandle: true,
                    barrierColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                          0.8,
                        ),
                  );
                },
                tileColor: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                title: Text(
                  "Report",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.red,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportSheet extends StatelessWidget {
  const ReportSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Report",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      height: 2.5,
                    ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                height: 0,
              ),
              ListTile(
                minVerticalPadding: 10,
                title: Text(
                  "Why are you reporting this thread?",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(height: 3, fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infrigement. If someone is in immediate danger, call the local emergency services - dont' wait.",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(
                              0.5,
                            ),
                      ),
                ),
                isThreeLine: true,
              ),
              ListTile(
                title: const Text("I just don't like it"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
              ListTile(
                title: const Text("It's unlawful context under NetzDG"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
              ListTile(
                title: const Text("It's spam"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
              ListTile(
                title: const Text("Hate speech or symbols"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
              ListTile(
                title: const Text("Nudity or sexual activity"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
              ListTile(
                title: const Text("I just don't like it"),
                trailing: Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
