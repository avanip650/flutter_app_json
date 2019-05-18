import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var myStudentData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemCount: myStudentData == null ? 0 : myStudentData.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          "Id is :- " + myStudentData[index]["id"],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          "Name is  :- " + myStudentData[index]["name"],
                          style: TextStyle(fontSize: 20),
                        ),
                        new Text(
                          "Student is :- " + myStudentData[index]["std"],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            future: DefaultAssetBundle.of(context)
                .loadString("loadjson/person.json"),
          ),
        ),
      ),
    );
  }
}