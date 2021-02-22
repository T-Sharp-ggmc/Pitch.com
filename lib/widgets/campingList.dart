import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../appTheme.dart';
import '../models/campingList.dart';

class CampingList {
  List<CampingListDto> premiumList = CampingListDto.premiumList;

  List<Widget> getPosts() {
    List<Widget> posts = [];
    for (int i = 0; i < premiumList.length; i++) {
      posts.add(getPost(i));
    }
    return posts;
  }

  Widget getPost(int index) {
    return ClipRRect(
        child: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 1),
          color: Colors.grey,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 2,
                    child: Image.asset(
                      premiumList[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: AppTheme.getTheme().backgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 2, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    premiumList[index].name,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        premiumList[index].info,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.grey.withOpacity(0.8)),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        size: 12,
                                        color: AppTheme.getTheme().primaryColor,
                                      ),
                                      Expanded(
                                        child: Text(
                                          premiumList[index].dist.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          size: 20,
                                          color:
                                              AppTheme.getTheme().primaryColor,
                                          borderColor:
                                              AppTheme.getTheme().primaryColor,
                                        ),
                                        Text(
                                          'Stelle',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    onTap: () {
                      premiumList[index].isFavorite =
                          premiumList[index].isFavorite;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: premiumList[index].isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: AppTheme.getTheme().primaryColor,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: AppTheme.getTheme().primaryColor,
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ],
    )));
  }
}
