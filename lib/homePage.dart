import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String url = "https://jsonplaceholder.typicode.com/comments";
  List data = [];

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(Uri.encodeFull(url));
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text(
                    data[index]["name"].toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    data[index]["email"].toString(),
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
