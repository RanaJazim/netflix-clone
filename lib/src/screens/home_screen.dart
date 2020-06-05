import 'package:netflix_clone/src/screens/coming_soon_screen.dart';
import 'package:netflix_clone/src/screens/menu_screen.dart';
import 'package:netflix_clone/src/screens/single_preview_screen.dart';
import 'package:netflix_clone/src/widgets/video_action_buttons.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Image.network(
            _netflixImg,
            fit: BoxFit.cover,
          ),
        ),
        title: _AppBarTitle(),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _bottomTabs(),
      body: TabBarView(
        children: <Widget>[
          _HomeScreenView(),
          Text("Search"),
          ComingSoonScreen(),
          MenuScreen(),
        ],
      ),
    );
  }

  Widget _bottomTabs() {
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

class _HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ImageSection(),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(10),
          child: _Previews(),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(10),
          child: _FeaturedVideoList("Continue Watching For Jazim Abbas"),
        ),
      ],
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _title("Movies"),
        _title("TV Shows"),
        _title("My List"),
      ],
    );
  }

  Widget _title(String title) {
    return Text(
      "$title",
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.height / 2) + 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black54.withOpacity(0.5), BlendMode.dstATop),
              image: NetworkImage(_headerImg),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: (MediaQuery.of(context).size.width / 4) - 20,
          child: VideoActionButtons(),
        ),
      ],
    );
  }
}

class _Previews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Previews",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 150,
          child: _previewList(),
        ),
      ],
    );
  }

  Widget _previewList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (ctx, index) => GestureDetector(
        child: Container(
          width: 100,
          margin: EdgeInsets.only(top: 5.0, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 53,
                  backgroundImage: NetworkImage(_headerImg),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "World War Z",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (_) => SinglePreviewScreen(),
            ),
          );
        },
      ),
    );
  }
}

class _FeaturedVideoList extends StatelessWidget {
  final String _title;

  _FeaturedVideoList(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$_title",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) => Container(
              padding: EdgeInsets.only(right: 5.0, top: 5.0),
              child: Image.network(_headerImg),
            ),
          ),
        ),
      ],
    );
  }
}

final _netflixImg =
    "https://i.pinimg.com/236x/19/3f/ab/193fabc89f1d0fe84cc480b375cbffa7.jpg";
final _headerImg =
    "https://i.pinimg.com/236x/9f/57/5d/9f575de10e5ab3b5da01e6d42281e765.jpg";
