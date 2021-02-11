import 'package:WeCanTry/models/ItemsCategory.dart';
import 'package:flutter/material.dart';

class CampingList {
  List<Widget> getPosts() {
    List<Widget> posts = [];

    for (int i = 0; i < 10; i++) {
      posts.add(getPost());
    }
    return posts;
  }

  Widget getPost() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(ItemsCategory.img[0].imagePath),
                    ),
                  ),
                  Text('post.user.username,11')
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 1),
          color: Colors.grey,
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 282),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ItemsCategory.img[0].imagePath))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.mode_comment),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
            Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Icon(
                  Icons.bookmark,
                  size: 30,
                  color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.bookmark),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
        FlatButton(
          child: Text(
            " likes",
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 10),
              child: Text('post.user.username'),
            ),
            Text(
              'post.description',
            )
          ],
        ),
      ],
    ));
  }
}
