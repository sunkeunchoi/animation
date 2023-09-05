import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
                style: Theme.of(context).textTheme.titleLarge,
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
                  ActivityTab(name: "Verified", isActive: _tabController.index == 3),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            Column(
              children: [
                ActivityCard(
                  url: "https://picsum.photos/id/21/100",
                  type: ActivityType.mention,
                  profileName: "john_mobbin",
                  minutes: 250,
                  message: "Here's a thread you should follow if you love botany @jane_mobbin",
                ),
                ActivityCard(
                  url: "https://picsum.photos/id/22/100",
                  type: ActivityType.reply,
                  profileName: "john_mobbin",
                  minutes: 250,
                  message: "Starting out my gardening club with three people",
                  text: "Count me in!",
                ),
                ActivityCard(
                  url: "https://picsum.photos/id/23/100",
                  type: ActivityType.following,
                  profileName: "the.plantdads",
                  minutes: 310,
                ),
                ActivityCard(
                  url: "https://picsum.photos/id/23/100",
                  type: ActivityType.like,
                  profileName: "the.plantdads",
                  minutes: 310,
                  message: "Definitely broken!",
                  text: "🧵👀🌱",
                ),
                ActivityCard(
                  url: "https://picsum.photos/id/24/100",
                  type: ActivityType.like,
                  profileName: "the.plantdads",
                  minutes: 310,
                  text: "🧵👀🌱",
                ),
              ],
            ),
            Center(
              child: Text('Replies'),
            ),
            Center(
              child: Text('Mentions'),
            ),
            Center(
              child: Text('Verified'),
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
    required this.url,
    required this.type,
    required this.profileName,
    required this.minutes,
    this.message = "",
    this.text = "",
  });
  final String url;
  final ActivityType type;
  final String profileName;
  final num minutes;
  final String message;
  final String text;

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
            maxLines: type == ActivityType.reply ? 1 : null,
            overflow: type == ActivityType.reply ? TextOverflow.ellipsis : TextOverflow.visible,
            text: TextSpan(
              text: type == ActivityType.mention || type == ActivityType.following ? type.text : message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
              children: [
                if (type == ActivityType.like)
                  TextSpan(
                    text: " $text",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
              ],
            ),
          ),
          if (type == ActivityType.mention || type == ActivityType.reply)
            Text(
              type == ActivityType.reply ? text : message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
        ],
      ),
      title: Text.rich(
        TextSpan(
          text: "$profileName ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          children: [
            TextSpan(
              text: "${minutes > 60 ? minutes ~/ 60 : minutes}${minutes > 60 ? "h" : "m"}",
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
            backgroundImage: NetworkImage(url),
            radius: 28,
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: type.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: Icon(
                type.icon,
                color: Theme.of(context).colorScheme.surface,
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
          color: isActive ? Theme.of(context).colorScheme.onSurface : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? Colors.transparent : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}