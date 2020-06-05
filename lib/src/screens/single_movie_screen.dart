import 'package:flutter/material.dart';

class SingleMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, _) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _headerVideo(context),
              ),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            VideoContent(),
          ],
        ),
      ),
    );
  }

  Widget _headerVideo(context) {
    return Stack(
      children: <Widget>[
        Image.network(
          "$_imgUrl",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 100,
          left: (MediaQuery.of(context).size.width / 2) - 30,
          child: const Icon(
            Icons.play_circle_outline,
            size: 70,
          ),
        ),
      ],
    );
  }
}

class VideoContent extends StatelessWidget {
  final double _heightBetweenSections = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "World War Z",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: _heightBetweenSections),
          Row(
            children: <Widget>[
              _lightText("2017"),
              SizedBox(width: 10),
              _lightText("18+"),
              SizedBox(width: 10),
              _lightText("2h 13m"),
            ],
          ),
          SizedBox(height: _heightBetweenSections),
          const Text(
            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
            style: const TextStyle(
              letterSpacing: 1.2,
              height: 1.5,
              fontSize: 15,
            ),
          ),
          SizedBox(height: _heightBetweenSections),
          _casteInfo(
            "Starring",
            "Brad Pitt, Daniella Kertesz, Mathew Fox",
          ),
          SizedBox(height: 7),
          _casteInfo("Director", "Marc Foster"),
        ],
      ),
    );
  }

  Widget _lightText(String content) {
    return Text(
      "$content",
      style: const TextStyle(color: Colors.white54),
    );
  }

  Widget _casteInfo(String title, String content) {
    return Row(
      children: <Widget>[
        Text(
          "$title:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        Text(
          "$content",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

final _imgUrl =
    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350";
