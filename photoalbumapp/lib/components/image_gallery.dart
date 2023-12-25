import 'package:flutter/material.dart';
import 'package:photoalbum/common/x_file_eq.dart';
import 'package:photoalbum/components/image_card.dart';

class ImageGallery extends StatelessWidget {
  final List<XFileEq> images;

  final double padding = 5;

  const ImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return gridImageWidget(screenWidth);
  }

  Widget gridImageWidget(double screenWidth) {
    // padding * 3, -1 padding is flush, 2 padding is half, and 3 padding is 1 padding on each side
    // extra padding is to counteract the spacing in the wrap
    final imageWidth = (screenWidth - padding * 3) / 4;
    return Wrap(
      spacing: padding,
      runSpacing: padding,
      children: [
        for (var image in images)
          ImageCard(
            image: image.xFile,
            width: imageWidth,
            height: imageWidth,
          )
      ],
    );
  }
}
