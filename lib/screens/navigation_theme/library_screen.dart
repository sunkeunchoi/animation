import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key, this.image, required this.isFromGallery});
  final XFile? image;
  final bool isFromGallery;
  static Route route({
    XFile? image,
    bool isFromGallery = false,
  }) =>
      MaterialPageRoute(
        builder: (context) => LibraryScreen(
          image: image,
          isFromGallery: isFromGallery,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
