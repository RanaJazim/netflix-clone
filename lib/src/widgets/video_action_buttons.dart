import 'package:flutter/material.dart';
import 'package:netflix_clone/src/widgets/text_icon.dart';

class VideoActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextIcon("My List", Icons.add),
        SizedBox(width: 40),
        FlatButton.icon(
          color: Colors.white,
          icon: Icon(
            Icons.play_circle_filled,
            color: Colors.black,
          ),
          label: const Text(
            "Play",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
        SizedBox(width: 40),
        TextIcon("Info", Icons.info),
      ],
    );
  }
}