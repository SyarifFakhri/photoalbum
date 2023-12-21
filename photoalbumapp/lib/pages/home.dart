import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoalbum/components/image_gallery.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<XFile> _images = [];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _images.isEmpty
                    ? const Text(
                        "Choose some images!",
                        textScaleFactor: 1.5,
                      )
                    : ImageGallery(images: _images),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Get Image',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future getImage() async {
    final List<XFile> images = await _picker.pickMultiImage();

    setState(() {
      _images = images;
    });
  }
}
