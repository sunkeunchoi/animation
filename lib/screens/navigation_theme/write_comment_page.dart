import 'dart:io';

import 'package:animation_class/screens/navigation_theme/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/posts/post_provider.dart';
import '../../models/posts/post_service.dart';

class WriteCommentPage extends StatefulWidget {
  const WriteCommentPage({super.key});

  @override
  State<WriteCommentPage> createState() => _WriteCommentPageState();
}

class _WriteCommentPageState extends State<WriteCommentPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "New Thread",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                      0.05,
                    ),
                height: 0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                "https://picsum.photos/id/32/100",
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(
                                      0.3,
                                    ),
                                width: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Opacity(
                              opacity: 0.5,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  "https://picsum.photos/id/32/100",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 25,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 20,
                      ),
                      child: PostPreview(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const Row(
                  children: [
                    Text("Any one can reply"),
                    Spacer(),
                    PostSubmitButton(),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostSubmitButton extends ConsumerWidget {
  const PostSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        await ref.read(postService.notifier).uploadPost(
              post: ref.read(postProvider),
            );
        Navigator.pop(context);
      },
      child: Text(
        "Post",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ref.watch(postProvider).isValid
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
    );
  }
}

class PostPreview extends ConsumerWidget {
  const PostPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "jane_mobbin",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const PostTitle(),
        const PostContent(),
        const SizedBox(
          height: 20,
        ),
        const PostAttachImagesButton(),
        const SizedBox(
          height: 20,
        ),
        if (ref.watch(postProvider).imagePaths.isNotEmpty)
          ...ref
              .read(postProvider)
              .imagePaths
              .map(
                (e) => [
                  Photo(image: e),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
              .expand((element) => element)
              .toList(),
      ],
    );
  }
}

class PostAttachImagesButton extends ConsumerWidget {
  const PostAttachImagesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        var images = await Navigator.of(context).push<List<XFile>?>(
          CameraScreen.route(),
        );
        if (images != null && images.isNotEmpty) {
          ref.read(postProvider.notifier).updateImages(images.map((e) => File(e.path)).toList());
        }
      },
      child: Icon(
        FluentIcons.attach_24_filled,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class PostTitle extends ConsumerWidget {
  const PostTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref.read(postProvider.notifier).updateTitle(value);
      },
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.6,
        ),
        hintText: "Start a thread...",
        hintStyle: TextStyle(
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(
                0.5,
              ),
        ),
      ),
    );
  }
}

class PostContent extends ConsumerWidget {
  const PostContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref.read(postProvider.notifier).updateContent(value);
      },
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(
          top: 5,
          bottom: 5,
        ),
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.image,
  });

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: FileImage(
            File(
              image.path,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
