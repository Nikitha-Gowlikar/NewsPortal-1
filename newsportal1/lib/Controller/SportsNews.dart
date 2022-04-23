import 'package:flutter/material.dart';
import 'package:newsportal1/View/SportsNews/Sp_all_news.dart' as allNews;

class Sports extends StatefulWidget {
  @override //i dint gave the arguments in this ,,,
  _SportsState createState() => new _SportsState();
}

class _SportsState extends State<Sports> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Sports News"),
          backgroundColor: Color(0xFF372B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.sports_cricket_outlined),
                text: "Sports News",
              ),
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new allNews.SportsAllNews(),
        ],
      ),
    );
  }
}
