import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  final _items = ["First", "Second", "Third"];

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(PopupOverlay(_items));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                const Text(
                  "My List",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: () {
              _showOverlay(context);
            },
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return GridView.builder(
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

class PopupOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  final List<String> _items;

  PopupOverlay(this._items);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildItem(String content) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "$content",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, index) => _buildItem(_items[index]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              backgroundColor: Colors.white70,
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
