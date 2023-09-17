import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../widgets/logo.dart';
import 'activity_screen.dart';
import 'domain/user.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  static const name = 'home';
  static const path = '/home';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(BuildContext context, int index) {
    if (index == 2) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        showDragHandle: false,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const Text("WriteCommentPage"),
          // child: const WriteCommentPage(),
        ),
        barrierColor: Theme.of(context).colorScheme.onSurface.withOpacity(
              0.8,
            ),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getPage(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchPage();
      case 3:
        return const ActivityScreen();
      case 4:
        return ProfileScreen(
          profile: User(
            name: "Jane",
            nickName: "jane_mobbin",
            url: "threads.net",
            bio: "Plant enthusiast!",
            profileUrl: "https://picsum.photos/id/100/100",
            followers: ["https://picsum.photos/id/201/100", "https://picsum.photos/id/301/100"],
          ),
        );
      default:
        return const Center(
          child: Text(
            'Home',
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: _selectedIndex == 0 ? const Logo() : null,
      ),
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
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(context, index),
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
      body: getPage(context),
    );
  }
}
