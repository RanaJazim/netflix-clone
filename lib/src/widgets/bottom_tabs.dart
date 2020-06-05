import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      unselectedLabelStyle: TextStyle(
        color: Colors.white.withOpacity(0.8),
      ),
      tabs: <Widget>[
        _clickableTab(
          "Home",
          Icons.home,
        ),
        _clickableTab(
          "Search",
          Icons.search,
        ),
        _clickableTab(
          "Coming Soon",
          Icons.video_library,
        ),
        _clickableTab(
          "Menu",
          Icons.menu,
        ),
      ],
    );
  }

  Widget _clickableTab(String title, IconData icon) {
    return Tab(
      icon: Icon(icon),
      child: Text(
        "$title",
        style: const TextStyle(fontSize: 11),
      ),
    );
  }
}
