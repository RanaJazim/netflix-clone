import 'package:netflix_clone/src/widgets/text_icon.dart';

import 'package:flutter/material.dart';

class SingleMovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _headerVideo(context),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(height: 20),
                VideoContent(),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: _actionButtons(),
                ),
                SizedBox(height: 20),
                NestedTabBar(),
              ],
            ),
          ),
        ],
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

  Widget _actionButtons() {
    final spaceBetweenWidgets = 50.0;
    return Row(
      children: <Widget>[
        TextIcon("My List", Icons.add),
        SizedBox(width: spaceBetweenWidgets),
        TextIcon("Rate", Icons.thumb_up),
        SizedBox(width: spaceBetweenWidgets),
        TextIcon("Share", Icons.share),
      ],
    );
  }
}

// NestedScrollView(
//         headerSliverBuilder: (ctx, _) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 200,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: _headerVideo(context),
//               ),
//             ),
//           ];
//         },
//         body: ListView(
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             VideoContent(),
//             SizedBox(height: 20),
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               child: _actionButtons(),
//             ),
//             SizedBox(height: 20),
//             NestedTabBar(),
//           ],
//         ),
//       ),

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

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            Tab(
              text: "MORE LIKE THIS",
            ),
            Tab(
              text: "TRAILERS",
            ),
            Tab(
              text: "MORE",
            ),
          ],
        ),
        Container(
          height: 300,
          padding: EdgeInsets.all(15),
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              Text("More Like this."),
              Text("Trailers."),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  20,
                  (index) => Text("some text here.."),
                ).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final _imgUrl =
    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350";

// class SingleMovieScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: (ctx, _) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 200,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: _headerVideo(context),
//               ),
//             ),
//           ];
//         },
//         body: ListView(
//           shrinkWrap: true,
//           children: <Widget>[
//             VideoContent(),
//             SizedBox(height: 20),
//             Container(
//               margin: EdgeInsets.only(left: 20),
//               child: _actionButtons(),
//             ),
//             SizedBox(height: 20),
//             NestedTabBar(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _headerVideo(context) {
//     return Stack(
//       children: <Widget>[
//         Image.network(
//           "$_imgUrl",
//           fit: BoxFit.cover,
//           width: double.infinity,
//         ),
//         Positioned(
//           bottom: 100,
//           left: (MediaQuery.of(context).size.width / 2) - 30,
//           child: const Icon(
//             Icons.play_circle_outline,
//             size: 70,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _actionButtons() {
//     final spaceBetweenWidgets = 50.0;
//     return Row(
//       children: <Widget>[
//         TextIcon("My List", Icons.add),
//         SizedBox(width: spaceBetweenWidgets),
//         TextIcon("Rate", Icons.thumb_up),
//         SizedBox(width: spaceBetweenWidgets),
//         TextIcon("Share", Icons.share),
//       ],
//     );
//   }
// }

// class VideoContent extends StatelessWidget {
//   final double _heightBetweenSections = 15.0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text(
//             "World War Z",
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           SizedBox(height: _heightBetweenSections),
//           Row(
//             children: <Widget>[
//               _lightText("2017"),
//               SizedBox(width: 10),
//               _lightText("18+"),
//               SizedBox(width: 10),
//               _lightText("2h 13m"),
//             ],
//           ),
//           SizedBox(height: _heightBetweenSections),
//           const Text(
//             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
//             style: const TextStyle(
//               letterSpacing: 1.2,
//               height: 1.5,
//               fontSize: 15,
//             ),
//           ),
//           SizedBox(height: _heightBetweenSections),
//           _casteInfo(
//             "Starring",
//             "Brad Pitt, Daniella Kertesz, Mathew Fox",
//           ),
//           SizedBox(height: 7),
//           _casteInfo("Director", "Marc Foster"),
//         ],
//       ),
//     );
//   }

//   Widget _lightText(String content) {
//     return Text(
//       "$content",
//       style: const TextStyle(color: Colors.white54),
//     );
//   }

//   Widget _casteInfo(String title, String content) {
//     return Row(
//       children: <Widget>[
//         Text(
//           "$title:",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(width: 5),
//         Text(
//           "$content",
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(color: Colors.white70),
//         ),
//       ],
//     );
//   }
// }

// class NestedTabBar extends StatefulWidget {
//   @override
//   _NestedTabBarState createState() => _NestedTabBarState();
// }

// class _NestedTabBarState extends State<NestedTabBar>
//     with SingleTickerProviderStateMixin {
//   TabController _controller;

//   @override
//   void initState() {
//     _controller = TabController(vsync: this, length: 3);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         TabBar(
//           controller: _controller,
//           indicatorSize: TabBarIndicatorSize.label,
//           tabs: <Widget>[
//             Tab(
//               text: "MORE LIKE THIS",
//             ),
//             Tab(
//               text: "TRAILERS",
//             ),
//             Tab(
//               text: "MORE",
//             ),
//           ],
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.all(15),
//           child: TabBarView(
//             controller: _controller,
//             children: <Widget>[
//               Text("More Like this."),
//               Text("Trailers."),
//               ListView(
//                 shrinkWrap: true,
//                 children: List.generate(
//                   20,
//                   (index) => Text("some text here.."),
//                 ).toList(),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// final _imgUrl =
//     "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350";
