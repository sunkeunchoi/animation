import 'package:animation_class/screens/navigation_theme/privacy_screen.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLoggedOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
          'Settings',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(FluentIcons.person_add_24_regular),
              title: Text(
                'Follow and invite friends',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.service_bell_24_regular),
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyScreen()));
              },
              leading: const Icon(FluentIcons.lock_closed_24_regular),
              title: Text(
                'Privacy',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.person_24_regular),
              title: Text(
                'Account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.chat_help_24_regular),
              title: Text(
                'Help',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.info_24_regular),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                          title: const Text("Log out"),
                          content: const Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  isLoggedOut = true;
                                });
                              },
                              child: const Text("Log out"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "Log out",
                    ),
                  ),
                  const Spacer(),
                  if (isLoggedOut)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                          backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
