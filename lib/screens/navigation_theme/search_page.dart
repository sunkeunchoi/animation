import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const CupertinoSearchTextField(
              placeholder: 'Search',
              itemColor: CupertinoColors.systemGrey,
              prefixInsets: EdgeInsetsDirectional.only(
                start: 12,
                top: 12,
                bottom: 12,
              ),
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/21/100",
              profileName: "rimithun",
              userName: "Mithun",
              followers: 26612,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/22/100",
              profileName: "vicenews",
              userName: "VICE News",
              followers: 301000,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/23/100",
              profileName: "trevornoah",
              userName: "Trevor Noah",
              followers: 789000,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/25/100",
              profileName: "condenasttraveller",
              userName: "Condé Nast Traveller",
              followers: 130000,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/26/100",
              profileName: "condenasttraveller",
              userName: "Condé Nast Traveller",
              followers: 130000,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/27/100",
              profileName: "chef_pillai",
              userName: "Suresh Pillai",
              followers: 69200,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/28/100",
              profileName: "malala",
              userName: "Malala Yousafzai",
              followers: 237000,
            ),
            const ProfileCard(
              url: "https://picsum.photos/id/29/100",
              profileName: "sebin_cyriac",
              userName: "Fishing_freaks",
              followers: 53200,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.url,
    required this.profileName,
    required this.userName,
    required this.followers,
  });

  final String url;
  final String profileName;
  final String userName;
  final num followers;

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.compact(locale: "en_US");
    return ListTile(
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Row(
        children: [
          Text(
            profileName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            FluentIcons.checkmark_starburst_24_filled,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      subtitle: Text.rich(
        TextSpan(
          text: "$userName\n",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          children: [
            TextSpan(
              text: "${f.format(followers)} followers",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
        child: Text(
          "Follow",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
