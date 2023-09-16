import 'package:animation_class/theme/theme_view_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLoggedOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
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
        surfaceTintColor: Colors.transparent,
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
            const ThemeButton(),
            ListTile(
              leading: const Icon(FluentIcons.person_add_24_regular),
              title: Text(
                'Follow and invite friends',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.service_bell_24_regular),
              title: Text(
                'Notifications',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyScreen()));
              },
              leading: const Icon(FluentIcons.lock_closed_24_regular),
              title: Text(
                'Privacy',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.person_24_regular),
              title: Text(
                'Account',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.chat_help_24_regular),
              title: Text(
                'Help',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            ListTile(
              leading: const Icon(FluentIcons.info_24_regular),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.outline,
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
                                setState(() {});
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
                          backgroundColor: Theme.of(context).colorScheme.outline,
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

class ThemeButton extends ConsumerWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile.adaptive(
      title: const Text("Change theme"),
      subtitle: const Text("Light or dark theme"),
      value: ref.watch(themeProvider) == ThemeMode.dark,
      onChanged: (value) => ref.read(themeProvider.notifier).toggleTheme(),
    );
  }
}
