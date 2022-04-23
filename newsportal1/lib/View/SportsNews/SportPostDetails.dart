import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SportsPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;
  SportsPostDetails(this.snapshot);

  @override
  _SportsPostDetailsState createState() => new _SportsPostDetailsState();
}

class _SportsPostDetailsState extends State<SportsPostDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sports Post Details"),
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
            // height: MediaQuery.of(context).size.height,  //Pixel error the bottom
            color: Color(0xFF372B4A),
            child: new Column(
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
                        backgroundColor: Colors.deepOrange,
                      ),
                      new SizedBox(
                        width: 8.0,
                      ),
                      new Container(
                          width: MediaQuery.of(context).size.width / 1.35,
                          child: new Text(
                            widget.snapshot["title"],
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          ))
                    ],
                  ),
                ), //end of first container
                //second container

                new SizedBox(
                  height: 5.0,
                ),

                Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: new Text(
                    widget.snapshot["des"],
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
