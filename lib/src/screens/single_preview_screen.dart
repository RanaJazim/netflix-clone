import 'package:flutter/material.dart';
import 'package:netflix_clone/src/widgets/video_action_buttons.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class SinglePreviewScreen extends StatefulWidget {
  @override
  _SinglePreviewScreenState createState() => _SinglePreviewScreenState();
}

class _SinglePreviewScreenState extends State<SinglePreviewScreen> {
  StoryController _controller;

  @override
  void initState() {
    _controller = StoryController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          StoryView(
            controller: _controller,
            inline: true,
            repeat: false,
            onComplete: () {
              Navigator.pop(context);
            },
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.pop(context);
              }
            },
            storyItems: [
              StoryItem.pageImage(
                url:
                    "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                controller: _controller,
              ),
              StoryItem.pageImage(
                url:
                    "https://media1.giphy.com/media/Qu7Ehf1RIaTCN5ocwm/giphy.webp",
                controller: _controller,
              ),
              StoryItem.pageImage(
                url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                controller: _controller,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: (MediaQuery.of(context).size.width / 4) - 20,
            child: VideoActionButtons(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
