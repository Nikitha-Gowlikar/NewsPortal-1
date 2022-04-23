import 'dart:ui';

import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class HomePageDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  HomePageDetails(this.snapshot);

  @override
  _HomePageDetailsState createState() => new _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Latest Post Details"),
        backgroundColor: Color(0xFF322240),
      ),
      backgroundColor: Color(0xFF322240),
      body: new ListView(
        children: <Widget>[
          //start first container..
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(
                widget.snapshot["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //end first container..

          new Container(
            margin: EdgeInsets.all(10.0),
            // height: MediaQuery.of(context).size.height, //By this the Scroll has solved.
            color: Color(0xFF372B4A), //from here the scorllable
            child: SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center, // till here
                // child: new Column( //this one Commented
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //first container...
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new CircleAvatar(
                          child: new Text(widget.snapshot["title"][0]),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                        ),
                        new SizedBox(
                          width: 8.0,
                        ),
                        new Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: new Text(
                              widget.snapshot["title"],
                              style: TextStyle(
                                  fontSize: 19.0, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  //end of first container
                  new SizedBox(
                    height: 5.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.5),
                    child: new Text(
                      widget.snapshot["des"],
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ), // the end of the SingleChildScrolView
          ),
        ],
      ),
    );
  }
}
