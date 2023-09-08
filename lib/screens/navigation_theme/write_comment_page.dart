import 'dart:io';

import 'package:animation_class/screens/navigation_theme/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class WriteCommentPage extends StatefulWidget {
  const WriteCommentPage({super.key});

  @override
  State<WriteCommentPage> createState() => _WriteCommentPageState();
}

class _WriteCommentPageState extends State<WriteCommentPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool isEnabled = false;
  final List<XFile> _images = [];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
                  Flexible(
                    flex: 25,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "jane_mobbin",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            onChanged: (value) {
                              isEnabled = value.isNotEmpty;
                              setState(() {});
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
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var images = await Navigator.of(context).push<List<XFile>?>(
                                CameraScreen.route(),
                              );
                              if (images != null && images.isNotEmpty) {
                                setState(() {
                                  _images.addAll(images);
                                  _focusNode.unfocus();
                                });
                              }
                            },
                            child: Icon(
                              FluentIcons.attach_24_filled,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_images.isNotEmpty)
                            ..._images
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
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text("Any one can reply"),
                    const Spacer(),
                    Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isEnabled
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotWorking extends StatelessWidget {
  const NotWorking({
    super.key,
    required List<XFile> images,
  }) : _images = images;

  final List<XFile> _images;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Photo(image: _images[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: _images.length,
        shrinkWrap: true,
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.image,
  });

  final XFile image;

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
