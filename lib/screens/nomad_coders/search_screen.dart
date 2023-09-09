import 'package:animation_class/screens/navigation_theme/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> cards = [
  {
    "url": "https://picsum.photos/id/21/100",
    "profileName": "rimithun",
    "userName": "Mithun",
    "followers": 26612,
  },
  {
    "url": "https://picsum.photos/id/22/100",
    "profileName": "vicenews",
    "userName": "VICE News",
    "followers": 301000,
  },
  {
    "url": "https://picsum.photos/id/23/100",
    "profileName": "trevornoah",
    "userName": "Trevor Noah",
    "followers": 789000,
  },
  {
    "url": "https://picsum.photos/id/25/100",
    "profileName": "condenasttraveller",
    "userName": "Condé Nast Traveller",
    "followers": 130000,
  },
  {
    "url": "https://picsum.photos/id/26/100",
    "profileName": "condenasttraveller",
    "userName": "Condé Nast Traveller",
    "followers": 130000,
  },
  {
    "url": "https://picsum.photos/id/27/100",
    "profileName": "chef_pillai",
    "userName": "Suresh Pillai",
    "followers": 69200,
  },
  {
    "url": "https://picsum.photos/id/28/100",
    "profileName": "malala",
    "userName": "Malala Yousafzai",
    "followers": 237000,
  },
  {
    "url": "https://picsum.photos/id/29/100",
    "profileName": "sebin_cyriac",
    "userName": "Fishing_freaks",
    "followers": 53200,
  }
];

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
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
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
            for (final Map<String, dynamic> card in cards)
              ProfileCard(
                url: card["url"],
                profileName: card["profileName"],
                userName: card["userName"],
                followers: card["followers"],
              ),
          ],
        ),
      ),
    );
  }
}
