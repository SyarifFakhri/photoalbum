import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCard extends StatefulWidget {
  final XFile image;
  final double width;
  final double height;

  const ImageCard(
      {super.key, required this.image, this.width = 100, this.height = 100});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return imageWidget(widget.image, widget.width);
  }

  void toggleSelection() {
    setState(() {
      selected = !selected;
    });
  }

  Widget imageWidget(XFile image, double width) {
    final path = image.path;
    return InkWell(
      onTap: toggleSelection,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(color: Colors.pinkAccent.shade100),
        child: Transform.scale(
          scale: selected ? 0.9 : 1.0,
          child: Image.file(
            File(path),
            width: width,
            height: widget.height,
          ),
        ),
      ),
    );
  }
}
