import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class Activity {
  final String url;
  final ActivityType type;
  final String profileName;
  final num minutes;
  final String? message;
  final String? text;

  Activity({
    required this.url,
    required this.type,
    required this.profileName,
    required this.minutes,
    this.message,
    this.text,
  });
}

final List<Activity> cards = [
  Activity(
    url: "https://picsum.photos/id/21/100",
    type: ActivityType.mention,
    profileName: "john_mobbin",
    minutes: 250,
    message: "Here's a thread you should follow if you love botany @jane_mobbin",
  ),
  Activity(
    url: "https://picsum.photos/id/22/100",
    type: ActivityType.reply,
    profileName: "john_mobbin",
    minutes: 250,
    message: "Starting out my gardening club with three people",
    text: "Count me in!",
  ),
  Activity(
    url: "https://picsum.photos/id/23/100",
    type: ActivityType.following,
    profileName: "the.plantdads",
    minutes: 310,
  ),
  Activity(
    url: "https://picsum.photos/id/23/100",
    type: ActivityType.like,
    profileName: "the.plantdads",
    minutes: 310,
    message: "Definitely broken!",
    text: "🧵👀🌱",
  ),
  Activity(
    url: "https://picsum.photos/id/24/100",
    type: ActivityType.like,
    profileName: "the.plantdads",
    minutes: 310,
    text: "🧵👀🌱",
  ),
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Text(
                'Activity',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: null,
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(
                  right: 10,
                  top: 10,
                  bottom: 10,
                ),
                tabs: [
                  ActivityTab(name: "All", isActive: _tabController.index == 0),
                  ActivityTab(name: "Replies", isActive: _tabController.index == 1),
                  ActivityTab(name: "Mentions", isActive: _tabController.index == 2),
                  ActivityTab(name: "Following", isActive: _tabController.index == 3),
                  ActivityTab(name: "Likes", isActive: _tabController.index == 4),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              itemBuilder: (
                context,
                index,
              ) =>
                  ActivityCard(
                activity: cards.elementAt(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cards.length,
            ),
            ListView.separated(
              itemBuilder: (
                context,
                index,
              ) =>
                  ActivityCard(
                activity: cards.where((element) => element.type == ActivityType.reply).elementAt(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cards.where((element) => element.type == ActivityType.reply).length,
            ),
            ListView.separated(
              itemBuilder: (
                context,
                index,
              ) =>
                  ActivityCard(
                activity: cards.where((element) => element.type == ActivityType.mention).elementAt(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cards.where((element) => element.type == ActivityType.mention).length,
            ),
            ListView.separated(
              itemBuilder: (
                context,
                index,
              ) =>
                  ActivityCard(
                activity: cards.where((element) => element.type == ActivityType.following).elementAt(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cards.where((element) => element.type == ActivityType.following).length,
            ),
            ListView.separated(
              itemBuilder: (
                context,
                index,
              ) =>
                  ActivityCard(
                activity: cards.where((element) => element.type == ActivityType.like).elementAt(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: cards.where((element) => element.type == ActivityType.like).length,
            ),
          ],
        ),
      ),
    );
  }
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

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
  });
  final Activity activity;

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

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.name,
    required this.isActive,
  });
  final String name;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Container(
        width: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: !isActive ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
