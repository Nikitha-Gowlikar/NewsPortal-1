import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:newsportal1/View/SportsNews/SportPostDetails.dart';

// ignore: camel_case_types
class SportsAllNews extends StatefulWidget {
  @override
  _SportsAllNewsState createState() => _SportsAllNewsState();
}

// ignore: camel_case_types
class _SportsAllNewsState extends State<SportsAllNews> {
  Future getallPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap =
        await firestore.collection("SportsNews").getDocuments();
    return snap.documents;
  }

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getallPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF322240),
      body: FutureBuilder(
          future: getallPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text(
                  "Data Loading...",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: onRefresh,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (contex, index) {
                      return Slidable(
                          key: ValueKey(index),
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'To DELETE <----Swipe',
                              color: Colors.blueGrey,
                              icon: Icons.delete_sweep,
                            ),
                          ],
                          dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                            onWillDismiss: (actionType) {
                              return showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Delete'),
                                    content: Text('Item will be deleted'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cancel'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                      ),
                                      TextButton(
                                        child: Text('Ok'),
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),

                          // child:container();

                          child: Container(
                            height: 135.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xFF372B4A),
                            ),
                            margin: EdgeInsets.all(10.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: new Image.network(
                                      snapshot.data[index].data["image"],
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
                                  child: new Column(
                                    children: <Widget>[
                                      new Text(
                                        snapshot.data[index].data["title"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.white),
                                      ),
                                      new SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      SportsPostDetails(snapshot
                                                          .data[index])));
                                        },
                                        child: new Text(
                                          snapshot.data[index].data["des"],
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10.0,
                                      ),
                                      new Container(
                                        child: new Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,  //removes the space btw view and details
                                          children: <Widget>[
                                            new Container(
                                              child: new Row(
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.looks_sharp,
                                                    color: Colors.orangeAccent,
                                                  ),
                                                  new SizedBox(
                                                    width: 15.57,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Container(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: new Container(
                                                  padding: EdgeInsets.all(10.0),
                                                  decoration: new BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      color: Colors.blueGrey),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          new MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SportsPostDetails(
                                                                      snapshot.data[
                                                                          index])));
                                                    },
                                                    child: new Text(
                                                      "View Details",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors
                                                                  .greenAccent[
                                                              400]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    }),
              );
            }
          }),
    );
  }
}
