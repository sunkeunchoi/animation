import 'package:animation_class/screens/navigation_theme/settings_screen.dart';
import 'package:animation_class/screens/navigation_theme/widgets/camera.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  final String name = "Jane";

  final String nickName = "jane_mobbin";

  final String url = "threads.net";

  final String bio = "Plant enthusiast!";

  final String profileUrl = "https://picsum.photos/id/100/100";

  final List<String> followers = ["https://picsum.photos/id/201/100", "https://picsum.photos/id/301/100"];
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    FluentIcons.globe_24_regular,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 32,
                  ),
                  const Spacer(),
                  const Camera(),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      FluentIcons.navigation_24_filled,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(profileUrl),
                radius: 40,
              ),
              subtitle: Row(
                children: [
                  Text(
                    nickName,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      url,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(bio),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(followers.first),
                        radius: 20,
                      ),
                      Positioned(
                        right: -18,
                        bottom: 8,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(followers.last),
                          radius: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "${followers.length} followers",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.43,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.43,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Share Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              indicatorColor: Theme.of(context).colorScheme.onSurface,
              controller: _tabController,
              labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                  ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              indicatorWeight: 1.5,
              tabs: [
                Tab(
                  child: Text(
                    "Threads",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Replies",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileUrl),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        nickName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "5h",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(FluentIcons.more_horizontal_24_regular),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Give ",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                          children: [
                            TextSpan(
                              text: "@$nickName",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const TextSpan(text: " a follow if you wnat to see more travel content!"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const IconPack(),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileUrl),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        nickName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        "6h",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        FluentIcons.more_horizontal_24_regular,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Tea. ",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                          children: const [
                            TextSpan(text: "Spliage."),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const PostCard(
                        profileUrl: "https://picsum.photos/id/300/100",
                        nickName: "iwetmyplants",
                        message:
                            "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be",
                        imageUrl: "https://picsum.photos/id/400/100",
                        replies: 256,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  leading: LeadingAvatar(url: followers.last),
                  title: TitleHeader(
                    nickName: nickName,
                    hours: "5h",
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Always a dream to see the Medina in Morocco!",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const PostCard(
                        profileUrl: "https://picsum.photos/id/600/100",
                        nickName: "earthpix",
                        message: "What is one place you're absolutely traveling to by next year?",
                        replies: 256,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const IconPack(),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  leading: const LeadingAvatar(url: "https://picsum.photos/id/700/100"),
                  title: const TitleHeader(nickName: "jane_mobbin", hours: "5h"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "See you there!",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const IconPack(),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  leading: const LeadingAvatar(url: "https://picsum.photos/id/800/100"),
                  title: const TitleHeader(nickName: "iwetmyyplants", hours: "6h"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "See you there!",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const IconPack(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeadingAvatar extends StatelessWidget {
  const LeadingAvatar({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}

class TitleHeader extends StatelessWidget {
  const TitleHeader({
    super.key,
    required this.nickName,
    required this.hours,
  });

  final String nickName;
  final String hours;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          nickName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        Text(
          hours,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          FluentIcons.more_horizontal_24_regular,
        ),
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.profileUrl,
    required this.nickName,
    required this.message,
    this.imageUrl,
    required this.replies,
  });

  final String profileUrl;
  final String nickName;
  final String message;
  final String? imageUrl;
  final int replies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileUrl),
                radius: 15,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                nickName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Icon(
                FluentIcons.checkmark_starburst_24_filled,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            message,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          if (imageUrl != null)
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$replies replies",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class IconPack extends StatelessWidget {
  const IconPack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          FluentIcons.heart_24_regular,
          size: 32,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          FluentIcons.chat_empty_24_regular,
          size: 28,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          FluentIcons.arrow_repeat_all_24_regular,
          size: 28,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          FluentIcons.send_24_regular,
          size: 28,
        ),
      ],
    );
  }
}
