import 'package:flutter/material.dart';

import 'domain/post.dart';
import 'widgets/activity_card.dart';

final List<Post> cards = [
  Post(
    url: "https://picsum.photos/id/21/100",
    type: ActivityType.mention,
    profileName: "john_mobbin",
    minutes: 250,
    message: "Here's a thread you should follow if you love botany @jane_mobbin",
  ),
  Post(
    url: "https://picsum.photos/id/22/100",
    type: ActivityType.reply,
    profileName: "john_mobbin",
    minutes: 250,
    message: "Starting out my gardening club with three people",
    text: "Count me in!",
  ),
  Post(
    url: "https://picsum.photos/id/23/100",
    type: ActivityType.following,
    profileName: "the.plantdads",
    minutes: 310,
  ),
  Post(
    url: "https://picsum.photos/id/23/100",
    type: ActivityType.like,
    profileName: "the.plantdads",
    minutes: 310,
    message: "Definitely broken!",
    text: "🧵👀🌱",
  ),
  Post(
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
