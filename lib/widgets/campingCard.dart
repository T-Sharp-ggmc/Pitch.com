import 'package:WeCanTry/models/campingList.dart';
import 'package:WeCanTry/screens/detailScreen/campingDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../appTheme.dart';
import 'starRating.dart';


class CampingCardListView extends StatefulWidget {
  
  final bool isShowDate;
  final VoidCallback callback;
  final CampingListDto campingData;
  final AnimationController animationController;
  final Animation animation;
  
  const CampingCardListView({Key key, this.campingData, this.animationController, this.animation, this.callback, this.isShowDate: false}) : super(key: key);
  
  @override
  _CampingCardListViewState createState() => _CampingCardListViewState();
}
class _CampingCardListViewState extends State<CampingCardListView> {


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
            transform: new Matrix4.translationValues(0.0, 50 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
              child: Column(
                children: <Widget>[
                  widget.isShowDate
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(widget.campingData.date + ', ' + widget.campingData.pitchSize),
                        )
                      : SizedBox(),
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
                                child: Image.asset(
                                  widget.campingData.imagePath,
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
                                          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    widget.campingData.info,
                                                    style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
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
                                                      "${widget.campingData.dist.toStringAsFixed(1)} km to city",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
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
                                                      rating: widget.campingData.rating,
                                                      size: 20,
                                                      color: AppTheme.getTheme().primaryColor,
                                                      borderColor: AppTheme.getTheme().primaryColor,
                                                    ),
                                                    Text(
                                                      " ${widget.campingData.reviews} Reviews",
                                                      style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
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
                                        children: <Widget>[
                                          Text(
                                            "\$${widget.campingData.perDay}",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 22,
                                            ),
                                          ),
                                          Text(
                                            "/Al giorno",
                                            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
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
                                splashColor: AppTheme.getTheme().primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                onTap: () {
                                  try {
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => CampingDetailScreen(
                                          // passare campingData
                                        ),
                                      )
                                    );
                                    //widget.callback();
                                  } catch (e) {}
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(color: AppTheme.getTheme().backgroundColor, shape: BoxShape.circle),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                  onTap: () {
                                    widget.campingData.isFavorite = !widget.campingData.isFavorite;
                                    try {
                                      widget.callback();
                                    } catch (e) {
                                    } 
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: widget.campingData.isFavorite 
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
}