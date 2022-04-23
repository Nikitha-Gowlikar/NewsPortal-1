import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:newsportal1/Controller/InternationalNews.dart';
import 'package:newsportal1/Controller/LocalNews.dart';
import 'package:newsportal1/Controller/PoliticNews.dart';
import 'package:newsportal1/Controller/SportsNews.dart';
import 'package:newsportal1/Controller/Students.dart';
import 'package:newsportal1/HomePostDetails.dart';
import 'package:newsportal1/View/Covid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: cancel_subscriptions
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("post");
  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF322240),
      appBar: new AppBar(
        title: new Text("News Portal"),
        backgroundColor: Color(0xFF322240),
      ),
      drawer: new Drawer(
        child: new Container(
          decoration: new BoxDecoration(
            color: Color(0xFF372B4A),
          ),
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                //The Drawer Header For the Left Slides the Main page.
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.deepPurple,
                    Colors.purpleAccent,
                  ]),
                ),
                child: (Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'News Portal',
                      style: TextStyle(color: Colors.white, fontSize: 25.8),
                    ),
                  ),
                )),
              ),
              new ListTile(
                title: new Text(
                  "Students infoHub",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.article_sharp,
                  size: 25.5,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => Students()));
                },
              ),
              new ListTile(
                title: new Text(
                  "International News",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.flight_takeoff_rounded,
                  size: 25.5,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => InternationalNews()));
                },
              ),
              new ListTile(
                title: new Text(
                  "Sports News",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.sports_cricket_rounded,
                  size: 25.5,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Sports()));
                },
              ),
              new ListTile(
                title: new Text(
                  "Local News",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.run_circle_outlined,
                  size: 25.5,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => LocalNews()));
                },
              ),
              new ListTile(
                title: new Text(
                  "Politics News",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.policy,
                  size: 25.5,
                  color: Colors.white,
                ),
               onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Politcs()));
                },
              ),
              new ListTile(
                title: new Text(
                  "Covid Update",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: new Icon(
                  Icons.bug_report_outlined,
                  size: 25.5,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Covid()));
                },
              ),
            ],
          ),
        ),
      ),
      body: //using Ternary Operator to Get RidOff The Length Error.
          snapshot == null
              ? Center(child: CircularProgressIndicator())
              : new ListView(
                  //ternary eg ->  Statement==condition ? TrueStatement  : FalseStatement
                  children: <Widget>[
                    //First Container start
                    new Container(
                      height: 190.0,
                      margin: EdgeInsets.only(top: 10.0, left: 0.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Text(
                              "Latest Post",
                              style: TextStyle(
                                  fontSize: 17.6, color: Colors.white),
                            ),
                          ),
                          new Container(
                            height: 130.0,
                            margin: EdgeInsets.only(top: 10.0),
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 395.0,
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Color(0xFF372B4A),
                                    child: new Row(
                                      children: <Widget>[
                                        new Expanded(
                                          flex: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: new Image.network(
                                              snapshot[index]["image"],
                                              height: 120.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        new SizedBox(
                                          width: 10.0,
                                        ),
                                        new Expanded(
                                          flex: 2,
                                          child: new Container(
                                            color: Color(0xFF372B4A),
                                            child: new Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        new MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePageDetails(
                                                                    snapshot[
                                                                        index])));
                                                  },
                                                  child: new Text(
                                                    snapshot[index]
                                                        ["title"],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 21.0,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                new SizedBox(
                                                  height: 6.5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        new MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePageDetails(
                                                                    snapshot[
                                                                        index])));
                                                  },
                                                  child: new Text(
                                                    snapshot[index]["des"],
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        fontSize: 16.45,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                new SizedBox(
                                                  height: 5.0,
                                                ),
                                                new Container(
                                                  child: new Row(
                                                    children: <Widget>[
                                                      new SizedBox(
                                                        width: 15.0,
                                                      ),

                                                      // edited
                                                      new Icon(
                                                        Icons.looks,
                                                        color: Colors.orange,
                                                      ),
                                                      new SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.of(context).push(
                                                              new MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      HomePageDetails(
                                                                          snapshot[
                                                                              index])));
                                                        },
                                                        child: new Text(
                                                          "View Details",
                                                          style: TextStyle(
                                                              fontSize: 16.3,
                                                              color: Colors
                                                                  .greenAccent),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    //First Container end..

                    //second container start...

                    new Container(
                      margin: EdgeInsets.all(10.0),
                      height: 150.0,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Container(
                          height: 350.0,
                          width: MediaQuery.of(context).size.width,
                          child: Carousel(
                            boxFit: BoxFit.cover,
                            autoplay: true,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration: Duration(milliseconds: 2190),
                            dotSize: 5.0,
                            dotIncreasedColor: Colors.red,
                            dotBgColor: Colors.transparent,
                            dotPosition: DotPosition.bottomCenter,
                            dotVerticalPadding: 5.0,
                            showIndicator: true,
                            borderRadius: true,
                            indicatorBgPadding: 5.0,
                            overlayShadow: true,
                            overlayShadowColors: Colors.black.withOpacity(0.4),
                            overlayShadowSize: 4.0,
                            images: [
                              NetworkImage(
                                  'https://images.pexels.com/photos/344029/pexels-photo-344029.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1618269/pexels-photo-1618269.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/2081007/pexels-photo-2081007.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1332237/pexels-photo-1332237.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1332234/pexels-photo-1332234.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1332214/pexels-photo-1332214.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1331234/pexels-photo-1331234.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1324137/pexels-photo-1324137.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1331163/pexels-photo-1331163.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1331130/pexels-photo-1331130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                              NetworkImage(
                                  'https://images.pexels.com/photos/1332216/pexels-photo-1332216.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //second container end..
                    //Third Container start...
                    new Container(
                      height: 217.5,
                      margin: EdgeInsets.all(10.0),
                      child: new ListView(
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      InternationalNews()));
                                        },
                                        child: new Text(
                                          "International News",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  width: 10.0,
                                ),
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sports()));
                                        },
                                        child: new Text(
                                          "Sports News",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ), //first container end..

                          new SizedBox(
                            height: 10.0,
                          ),
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      LocalNews()));
                                        },
                                        child: new Text(
                                          "Local News",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                new SizedBox(
                                  width: 10.0,
                                ),
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Politcs()));
                                        },
                                        child: new Text(
                                          "Politics News",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new SizedBox(
                            height: 8.0,
                          ),
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 95.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Students()));
                                        },
                                        child: new Text(
                                          "Student Hub",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                /* new SizedBox(
                                  width: 10.0,
                                ),
                                new Expanded(
                                  flex: 1,
                                  child: new Container(
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xFF372B4A),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                     /* child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sports())); */
                                        },
                                        child: new Text(
                                          "Bussines",
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                    //Third Container End....

                  ],
                ),
    );
  }
}

