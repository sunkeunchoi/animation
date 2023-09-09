import 'package:flutter/material.dart';

import 'widgets/post_card_body.dart';
import 'widgets/post_card_header.dart';
import 'widgets/post_cart_footer.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

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
