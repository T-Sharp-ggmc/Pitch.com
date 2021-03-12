import 'package:my_camping/models/camping.dart';
import 'package:my_camping/services/favoriteService.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../appTheme.dart';
import '../screens/detailScreen/campingDetailScreen.dart';
import 'starRating.dart';

class CampingCardListView extends StatefulWidget {
  final VoidCallback callback;
  final Camping campingData;
  final AnimationController animationController;
  final Animation animation;

  const CampingCardListView(
      {Key key,
      this.campingData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  _CampingCardListViewState createState() => _CampingCardListViewState();
}

class _CampingCardListViewState extends State<CampingCardListView> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }
    
      @override
      Widget build(BuildContext context) {
        return AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: widget.animation,
              child: new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 50 * (1.0 - widget.animation.value), 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 8, bottom: 16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppTheme.getTheme().dividerColor,
                              offset: Offset(4, 4),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  AspectRatio(
                                      aspectRatio: 2,
                                      child: CachedNetworkImage(
                                        imageUrl: widget.campingData.photos.first,
                                        fit: BoxFit.cover,
                                      )),
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
                                                  left: 16, top: 8, bottom: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    widget.campingData.name,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        widget.campingData.city,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey
                                                                .withOpacity(0.8)),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        size: 12,
                                                        color: AppTheme.getTheme()
                                                            .primaryColor,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "2.5 km to city", //fare funzione per calcolo della distanza dalla citta
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.8)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 4),
                                                    child: Row(
                                                      children: <Widget>[
                                                        StarRating(
                                                          allowHalfRating: true,
                                                          starCount: 5,
                                                          rating: widget
                                                              .campingData.rating,
                                                          size: 20,
                                                          color: AppTheme.getTheme()
                                                              .primaryColor,
                                                          borderColor:
                                                              AppTheme.getTheme()
                                                                  .primaryColor,
                                                        ),
                                                        Text(
                                                          " ${widget.campingData.reviews} Reviews",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.8)),
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
                                          padding: const EdgeInsets.only(
                                              right: 16, top: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                "\$${widget.campingData.campingPitch.first.price}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              Text(
                                                "/Al giorno",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                bottom: 0,
                                left: 0,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: AppTheme.getTheme()
                                        .primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                    onTap: () {
                                      try {
                                        Navigator.pushNamed(
                                            context, CampingDetailScreen.routeName,
                                            arguments: widget.campingData);
                                      } catch (e) {}
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppTheme.getTheme().backgroundColor,
                                      shape: BoxShape.circle),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32.0),
                                      ),
                                      onTap: () async {
                                        if (isFavorite) 
                                        {
                                          await FavoriteService
                                              .removeInFavoriteList(
                                                  widget.campingData.cid);
                                        } else {
                                          await FavoriteService.addInFavoriteList(
                                              widget.campingData);
                                        }
                                        setState(() {
                                          asyncMethod();
                                        }); 
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: isFavorite
                                            ? Icon(
                                                Icons.favorite,
                                                color: AppTheme.getTheme()
                                                    .primaryColor,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: AppTheme.getTheme()
                                                    .primaryColor,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    
      Future<bool> isInFavoriteList(Camping camping) async {
        var favoriteList = await FavoriteService.getFavoriteList();
        for (var i = 0; i < favoriteList.length; i++) {
          if (favoriteList[i].cid == camping.cid) 
            return true;
        }
        return false;
      }
    
      void asyncMethod() async{
        isFavorite = await isInFavoriteList(widget.campingData);
      }
}
