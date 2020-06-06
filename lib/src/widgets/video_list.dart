import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: false,
      padding: EdgeInsets.all(10.0),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 5.0,
      ),
      itemBuilder: (_, index) => Container(
        child: Image.network(
          "$_imgUrl",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

final _imgUrl =
    "https://i.pinimg.com/236x/9f/57/5d/9f575de10e5ab3b5da01e6d42281e765.jpg";