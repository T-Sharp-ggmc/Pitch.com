import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:dashed_circle/dashed_circle.dart';

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
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text('in lavorazione')),
      // ignore: missing_required_param
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              // ignore: deprecated_member_use
              title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              // ignore: deprecated_member_use
              title: Text('search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              // ignore: deprecated_member_use
              title: Text('room_preferences')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_sharp),
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

//Struct Top Place
class TopPlaceImg {
  String imagePath;
  String titleTxt;
  String subTxt;
  String dateTxt;
  String roomSizeTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;
  bool isSelected;

  TopPlaceImg({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dateTxt = "",
    this.roomSizeTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
    this.isSelected = false,
  });
  static List<TopPlaceImg> img = [
    TopPlaceImg(
      imagePath: 'assets/images/first.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
      roomSizeTxt: '1 Room - 2 Adults',
      isSelected: true,
      dateTxt:
          '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
    ),
    TopPlaceImg(
      imagePath: 'assets/images/first.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
      roomSizeTxt: '1 Room - 2 Adults',
      isSelected: true,
      dateTxt:
          '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
    ),
  ];
}
