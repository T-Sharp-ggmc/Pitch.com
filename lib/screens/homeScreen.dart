import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Pitch.com"), actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.settings),
            )
          ]),

          //Top Destinations "First Row after appBar"
          body: Center(
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(25.0),
                          child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  children: <Widget>[Icon(Icons.sports)],
                                ),
                              )))
                    ])
              ],
            ),
          ),

          //Research Button
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.search),
            backgroundColor: Colors.lightBlue,
          ),
          endDrawer: Drawer()),
    );
  }
}
