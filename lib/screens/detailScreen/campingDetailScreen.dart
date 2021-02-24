import 'package:Pitch/appTheme.dart';
import 'package:Pitch/models/campingList.dart';
import 'package:Pitch/widgets/starRating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../sizeConfig.dart';
import 'widgets/customDetailAppBar.dart';
import 'widgets/detailsBottomBar.dart';

class CampingDetailScreen extends StatefulWidget {
  final CampingListDto camping;

  const CampingDetailScreen({Key key, this.camping}) : super(key: key);
  @override
  _CampingDetailScreenState createState() => _CampingDetailScreenState();
}

class _CampingDetailScreenState extends State<CampingDetailScreen> {
  List<String> images = new List<String>(); //da cambiare imagepath in camping models in array di immagini
  var pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    images.add(widget.camping.imagePath);
    images.add(widget.camping.imagePath);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.getTheme().backgroundColor,
      appBar: CustomDetailAppBar(widget.camping.isFavorite),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(350),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: PageView(
                          controller: pageController,
                          pageSnapping: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            for (var image in images)
                              Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                          ],
                        )),
                  ),
                  Positioned(
                    left: getProportionateScreenWidth(160),
                    top: getProportionateScreenHeight(325),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageIndicator(
                        layout: PageIndicatorLayout.WARM,
                        size: 10.0,
                        controller: pageController,
                        space: 5.0,
                        count: 3,
                        color: AppTheme.getTheme().backgroundColor,
                        activeColor: AppTheme.getTheme().primaryColor,
                      ),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: getProportionateScreenWidth(320)),
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
            width: double.infinity,
            color: AppTheme.getTheme().backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.camping.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.black),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.camping.info,
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 12,
                      color: AppTheme.getTheme().primaryColor,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Text(
                        "${widget.camping.dist} km dal centro",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: <Widget>[
                      StarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: widget.camping.rating,
                        size: 20,
                        color: AppTheme.getTheme().primaryColor,
                        borderColor: AppTheme.getTheme().primaryColor,
                      ),
                      Text(
                        " ${widget.camping.reviews} Reviews",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.getTheme().dividerColor,
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: DetailsBottomBar(),
    );
  }
}


