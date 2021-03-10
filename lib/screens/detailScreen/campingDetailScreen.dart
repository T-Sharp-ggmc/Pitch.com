import 'package:my_camping/appTheme.dart';
import 'package:my_camping/widgets/starRating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/camping.dart';
import '../../sizeConfig.dart';
import 'widgets/customDetailAppBar.dart';
import 'widgets/detailsBottomBar.dart';

class CampingDetailScreen extends StatefulWidget {
  static String routeName = "/campingDetail";

  const CampingDetailScreen({Key key}) : super(key: key);
  @override
  _CampingDetailScreenState createState() => _CampingDetailScreenState();
}

class _CampingDetailScreenState extends State<CampingDetailScreen> {
  var pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final Camping camping = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.getTheme().backgroundColor,
      appBar: CustomDetailAppBar(false), //passare true se favorite
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
                            for (var image in camping.photos)
                              CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                              )
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
                  camping.name,
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
                      camping.city,
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
                        "2.5 km dal centro",
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
                        rating: camping.rating,
                        size: 20,
                        color: AppTheme.getTheme().primaryColor,
                        borderColor: AppTheme.getTheme().primaryColor,
                      ),
                      Text(
                        " ${camping.reviews} Reviews",
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
