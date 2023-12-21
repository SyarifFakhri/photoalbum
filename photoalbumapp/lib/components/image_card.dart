import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCard extends StatelessWidget {
  final XFile image;
  final double width;
  final double height;

  const ImageCard(
      {super.key, required this.image, this.width = 100, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return imageWidget(image, width);
  }

  Widget imageWidget(XFile image, double width) {
    final path = image.path;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Image.file(
        File(path),
        width: width,
        height: height,
      ),
    );
  }
}
