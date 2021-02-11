import 'package:WeCanTry/widgets/FilterPremium.dart';
import 'package:WeCanTry/widgets/campingList.dart';
import 'package:flutter/material.dart';

//import 'package:dashed_circle/dashed_circle.dart';

import 'searchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //Variables
  Animation gap;
  Animation base;
  Animation reverse;
  AnimationController controller;

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                //logo image
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Image.asset(
                      'assets/Icons/logo.png',
                      fit: BoxFit.cover,
                      height: 40,
                    )),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              //scaffoldKey.currentState.showSnackBar(snackBar);
            },
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 85,
                child: FilterPremium().getStories(),
              ),
              Divider(),
              Column(
                children: CampingList().getPosts(),
              )
            ],
          )
        ],
      )),

      // ignore: missing_required_param
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              // ignore: deprecated_member_use
              title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              // ignore: deprecated_member_use
              title: Text('search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              // ignore: deprecated_member_use
              title: Text('room_preferences')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text('filter')),
        ],
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black87,
        iconSize: 35.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
