import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'widgets/logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
