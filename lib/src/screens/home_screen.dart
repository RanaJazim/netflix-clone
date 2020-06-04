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
      body: ListView(
        children: <Widget>[
          _ImageSection(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Previews(),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.all(10),
            child: FeaturedVideoList("Continue Watching For Jazim Abbas"),
          ),
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
        Tab(
          icon: Icon(Icons.home),
          child: _tabText("Home"),
        ),
        Tab(
          icon: Icon(Icons.search),
          child: _tabText("Search"),
        ),
        Tab(
          icon: Icon(Icons.search),
          child: _tabText("Coming Soon"),
        ),
        Tab(
          icon: Icon(Icons.menu),
          child: _tabText("Menu"),
        ),
      ],
    );
  }

  Widget _tabText(String title) {
    return Text(
      "$title",
      style: const TextStyle(
        fontSize: 11
      ),
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

class VideoActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _iconBelowText(Icons.add, "My List"),
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
        _iconBelowText(Icons.info, "Info"),
      ],
    );
  }

  Widget _iconBelowText(IconData icon, String title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Text(
          "$title",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class Previews extends StatelessWidget {
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
      itemBuilder: (_, index) => Container(
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
    );
  }
}

class FeaturedVideoList extends StatelessWidget {
  final String _title;

  FeaturedVideoList(this._title);

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

// ClipOval(
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.red,
//                     width: 2.0,
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//                 child: Image.network(
//                   _headerImg,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
