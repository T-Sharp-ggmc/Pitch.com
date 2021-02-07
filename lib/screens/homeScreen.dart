import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'searchScreen.dart';

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
            itemCount: 2,
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
            onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                      );
            },
            child: const Icon(Icons.search),
            backgroundColor: Colors.lightBlue,
          ),
          endDrawer: Drawer()),
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
      imagePath:
          'assets/images/historic-city-center-of-lecce-puglia-italy-royalty-free-image-695789434-1563545104.jpg',
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
      imagePath: 'index.jpg',
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
