import 'package:flutter/material.dart';
import 'package:newsportal1/View/InternationalNews/In_all_news.dart' as allnews;

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => new _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews>
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
          title: new Text("International News"),
          backgroundColor: Color(0xFF372B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.flight_takeoff_rounded),
                text: "International News",
              ),
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new allnews.In_AllNews(),
        ],
      ),
    );
  }
}
