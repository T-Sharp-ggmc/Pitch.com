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
          body: Center(
              child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, right: 24, left: 8),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20.0),
                            child: CircleAvatar(
                                radius: 45.0,
                                backgroundColor: Colors.blue,
                                child: Center(
                                  child: Column(
                                      //children: <Widget>[Icon(Icons.sports)],
                                      ),
                                ))),
                      ])
                ],
              );
            },
          )),

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
