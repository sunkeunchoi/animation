import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

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
