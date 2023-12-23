import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              child: Icon(Icons.picture_in_picture),
            ),
            Text(
              "Photo Album",
              textScaleFactor: 1.6,
            ),
          ],
        ));
  }
}
