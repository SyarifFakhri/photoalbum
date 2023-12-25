import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoalbum/common/x_file_eq.dart';
import 'package:photoalbum/components/image_gallery.dart';
import 'package:photoalbum/components/title_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final Set<XFileEq> _images = {};

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Center(child: TitleWidget()),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                child: const Text(
                  "October", // todo: this shouldn't be hardcoded
                  textScaleFactor: 1.2,
                ),
              ),
              SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: _images.isEmpty
                      ? const Center(
                          child: Text(
                            "Choose some images!",
                            textScaleFactor: 1.5,
                          ),
                        )
                      : ImageGallery(images: _images),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Get Image',
        child: const Icon(Icons.add_a_photo),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Gallery'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Order'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: 'Profile'),
      ]),
    );
  }

  Future getImage() async {
    final images = await _picker.pickMultiImage();
    setState(() {
      _images.addAll(images.map((e) => XFileEq(e)));
    });
  }
}
