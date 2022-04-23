import 'package:flutter/material.dart';
import 'package:newsportal1/View/LocalNews/Lo_all_news.dart' as allNews;

class LocalNews extends StatefulWidget {
  @override
  _LocalNewsState createState() => new _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews>
    with SingleTickerProviderStateMixin {
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
          title: new Text("Local News"),
          backgroundColor: Color(0xFF372B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.run_circle_rounded),
                text: "Local News",
              ),
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new allNews.LocalAllNews(),
        ],
      ),
    );
  }
}
