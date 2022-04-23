import 'package:flutter/material.dart';
import 'package:newsportal1/View/PoliticsNews/Po_all_news.dart' as allNews;

class Politcs extends StatefulWidget {
  @override
  _PolitcsState createState() => new _PolitcsState();
}

class _PolitcsState extends State<Politcs> with SingleTickerProviderStateMixin {
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
          title: new Text("Politics News"),
          backgroundColor: Color(0xFF372B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.policy_sharp),
                text: "Politics News",
              ),
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new allNews.Politica_all_News(),
        ],
      ),
    );
  }
}
