import 'package:WeCanTry/models/ItemsCategory.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterPremium {
  Widget getStories() {
    return ListView(
        scrollDirection: Axis.horizontal, children: getUserStories());
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (int i = 0; i < 18; i++) {
      stories.add(getStory());
    }
    return stories;
  }

  Widget getStory() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
              height: 50,
              width: 50,
              child: Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Container(
                    height: 47,
                    width: 47,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(ItemsCategory.img[0].imagePath),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {},
                  )
                ],
              )),
        ],
      ),
    );
  }
}
