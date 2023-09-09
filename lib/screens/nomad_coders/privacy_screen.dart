import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          backgroundColor: Theme.of(context).colorScheme.surface,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 28,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          unselectedIconTheme: IconThemeData(
            size: 28,
            color: Theme.of(context).colorScheme.outline,
          ),
          type: BottomNavigationBarType.fixed,
        ),
        child: BottomNavigationBar(
          currentIndex: 4,
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
      ),
      appBar: AppBar(
        leadingWidth: 120,
        leading: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(FluentIcons.ios_arrow_ltr_24_filled),
            ),
            const Text("Back"),
          ],
        ),
        title: const Text(
          'Privacy',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: value,
            onChanged: (changed) {
              setState(() {
                value = !value;
              });
            },
            title: Row(
              children: [
                const Icon(
                  FluentIcons.lock_closed_24_regular,
                  size: 28,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Private Profile",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.mention_20_regular,
              size: 28,
            ),
            title: Text(
              'Mentions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.5,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Icon(
                  FluentIcons.chevron_right_24_regular,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.alert_off_24_regular,
              size: 28,
            ),
            title: const Text(
              'Muted',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: -0.5,
              ),
            ),
            trailing: Icon(
              FluentIcons.chevron_right_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.eye_off_24_regular,
              size: 28,
            ),
            title: const Text(
              'Hidden Words',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: -0.5,
              ),
            ),
            trailing: Icon(
              FluentIcons.chevron_right_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.people_24_regular,
              size: 28,
            ),
            title: const Text(
              'Profile you follow',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: -0.5,
              ),
            ),
            trailing: Icon(
              FluentIcons.chevron_right_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          ListTile(
            title: Text(
              "Other privacy settings",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            trailing: Icon(
              FluentIcons.share_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.dismiss_circle_24_regular,
              size: 28,
            ),
            title: const Text("Blocked profiles"),
            trailing: Icon(
              FluentIcons.share_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          ListTile(
            leading: const Icon(
              FluentIcons.heart_broken_24_regular,
              size: 28,
            ),
            title: const Text("Hide likes"),
            trailing: Icon(
              FluentIcons.share_24_regular,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
