import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = [
    HomePage(),
    const Center(
      child: Text(
        'Search',
      ),
    ),
    const Center(
      child: Text(
        'Comments',
      ),
    ),
    const Center(
      child: Text(
        'Favorites',
      ),
    ),
    const Center(
      child: Text(
        'Profile',
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            activeIcon: Icon(FluentIcons.home_24_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.search_24_regular),
            activeIcon: Icon(FluentIcons.search_24_filled),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.comment_note_24_regular),
            activeIcon: Icon(FluentIcons.comment_note_24_filled),
            label: 'Comments',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.heart_24_regular),
            activeIcon: Icon(FluentIcons.heart_24_filled),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_24_regular),
            activeIcon: Icon(FluentIcons.person_24_filled),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<Map<String, dynamic>> posts = [
    {
      "user": "pubity",
      "text": "Vine after seeing the Threads logo unveiled",
      "minutes": "2m",
      "numberOfLikes": 391,
      "numberOfReplies": 36,
      "profile": "https://picsum.photos/id/1/100",
      "followers": [
        "https://picsum.photos/id/2/100",
        "https://picsum.photos/id/3/100",
        "https://picsum.photos/id/4/100",
      ],
      "images": [
        "https://picsum.photos/id/5/300/400",
        "https://picsum.photos/id/6/300/400",
      ],
    },
    {
      "user": "thetinderblog",
      "text": "Elon alone on Twitter right now...",
      "minutes": "5m",
      "numberOfLikes": 231,
      "numberOfReplies": 12,
      "profile": "https://picsum.photos/id/7/100",
      "followers": [
        "https://picsum.photos/id/8/100",
        "https://picsum.photos/id/9/100",
        "https://picsum.photos/id/10/100",
      ],
      "images": [
        "https://picsum.photos/id/11/400",
        "https://picsum.photos/id/12/400",
      ],
    },
    {
      "user": "tropicalseductions",
      "text": "Drop a comment here to test things out",
      "minutes": "2h",
      "numberOfLikes": 4,
      "numberOfReplies": 2,
      "profile": "https://picsum.photos/id/13/100",
      "followers": [
        "https://picsum.photos/id/14/100",
        "https://picsum.photos/id/15/100",
        "https://picsum.photos/id/199/100",
      ],
      "images": [
        "https://picsum.photos/id/16/500/400",
        "https://picsum.photos/id/17/500/400",
      ],
    },
    {
      "user": "shityoushouldcareabout",
      "text": "my phone feels like a vibrator with all these notifications rn",
      "minutes": "2h",
      "numberOfLikes": 631,
      "numberOfReplies": 64,
      "profile": "https://picsum.photos/id/18/100",
      "followers": [
        "https://picsum.photos/id/19/100",
        "https://picsum.photos/id/20/100",
        "https://picsum.photos/id/21/100",
      ],
    },
    {
      "user": "_plantswithkrystal_",
      "text": "If you're reading this, go water that thirsty plant. You're welcome ☺️",
      "minutes": "2h",
      "numberOfLikes": 74,
      "numberOfReplies": 8,
      "profile": "https://picsum.photos/id/24/100",
      "followers": [
        "https://picsum.photos/id/25/100",
        "https://picsum.photos/id/26/100",
        "https://picsum.photos/id/27/100",
      ],
    },
    {
      "user": "timferriss",
      "text": "Photoshoot with Molly pup. :)",
      "minutes": "7h",
      "numberOfLikes": 437,
      "numberOfReplies": 53,
      "profile": "https://picsum.photos/id/28/100",
      "followers": [
        "https://picsum.photos/id/29/100",
        "https://picsum.photos/id/30/100",
        "https://picsum.photos/id/31/100",
      ],
      "images": [
        "https://picsum.photos/id/22/400/600",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemBuilder: (context, index) {
        final Map<String, dynamic> post = posts[index];
        final String user = post["user"];
        final String text = post["text"];
        final String minutes = post["minutes"];
        final int numberOfLikes = post["numberOfLikes"];
        final int numberOfReplies = post["numberOfReplies"];
        final String profile = post["profile"];
        final List<String> followers = post["followers"];
        final List<String>? images = post["images"];
        return Column(
          children: [
            PostCardHeader(
              profile: profile,
              user: user,
              minutes: minutes,
              text: text,
              isTextOnly: images == null,
            ),
            PostCardBody(
              images: images,
            ),
            PostCardFooter(
              numberOfReplies: numberOfReplies,
              numberOfLikes: numberOfLikes,
              followers: followers,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(
                0.2,
              ),
        );
      },
      itemCount: posts.length,
    );
  }
}

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

class PostCardBody extends StatelessWidget {
  const PostCardBody({
    super.key,
    this.images,
  });
  final List<String>? images;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 3,
                height: images != null ? 450 : 60,
                // constraints: const BoxConstraints.expand(
                //   height: 400,
                // ),
                // height: double.infinity,
                // height: 300,
                // height: double.infinity,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.2,
                    ),
              ),
            ],
          ),
          // FittedBox(
          // fit: BoxFit.fitHeight,
          // child: Text("│"),
          // child:
          // ),
        ),
        const Spacer(),
        Expanded(
          flex: 35,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (images != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final String image in images!)
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                    height: 400,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(
                                          0.5,
                                        ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    FluentIcons.speaker_off_24_filled,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FluentIcons.heart_24_regular,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 38,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FluentIcons.chat_empty_24_regular,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FluentIcons.arrow_repeat_all_24_filled,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FluentIcons.send_24_regular,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 32,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
                  Icon(
                    FluentIcons.more_horizontal_24_filled,
                    color: Theme.of(context).colorScheme.onSurface,
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
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
