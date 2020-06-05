import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String _title;
  final IconData _icon;

  TextIcon(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          _icon,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          "$_title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}