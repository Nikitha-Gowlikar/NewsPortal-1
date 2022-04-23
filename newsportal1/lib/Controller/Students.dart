import 'package:flutter/material.dart';
import 'package:newsportal1/View/StudentsHub/In_all_news.dart' as snews;

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => new _StudentsState();
}

class _StudentsState extends State<Students>
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
          title: new Text("Student Hub"),
          backgroundColor: Color(0xFF372B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              new Tab(
                icon: Icon(Icons.article),
                text: "Student Hub",
              ),
            ],
          )),
      body: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new snews.In_AllNews (),
        ],
      ),
    );
  }
}