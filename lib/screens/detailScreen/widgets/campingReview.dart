import 'package:my_camping/models/campingReviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_camping/provider/reviewProvider.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../../utilities/appTheme.dart';
import '../../../widgets/starRating.dart';

class ReviewCard extends StatefulWidget {
  final String campingId;

  const ReviewCard({Key key, this.campingId}) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> with TickerProviderStateMixin {
  AnimationController animationController;
  double reviewHeight = 200;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ReviewProvider>(context).loadCampingReviews(widget.campingId);
    return Consumer<ReviewProvider>(builder: (context, provider, _) {
      if (provider.campingReviews != null) {
        if (provider.campingReviews.length == 0)
          reviewHeight = 25;
        else
          reviewHeight = 200;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: reviewHeight,
              child: provider.campingReviews.length == 0
                  ? noReviewList()
                  : ListView.builder(
                      itemCount: provider.campingReviews.length,
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var count = provider.campingReviews.length > 10
                            ? 10
                            : provider.campingReviews.length;
                        var animation = Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn)));
                        animationController.forward();
                        return ReviewCardListView(
                          callback: () {},
                          reviewListData: provider.campingReviews[index],
                          animation: animation,
                          animationController: animationController,
                        );
                      },
                    ),
            ),
            provider.campingReviews.length == 0
                ? SizedBox()
                : Center(
                  child: Container(
                      width: 325,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.getTheme().backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppTheme.getTheme().dividerColor,
                            offset: Offset(4, 4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: 
                      Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              highlightColor: Colors.transparent,
                              onTap: () {
                                //navigate to allreview page
                              },
                              child: Center(
                                child: Text(
                                  "Mostra tutte le recensioni",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                      ),
                ),
          ],
        );
      } else
        return Loading();
    });
  }

  Widget noReviewList() {
    return Center(
      child: Text(
        "Non ci sono recensioni per questo campeggio",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}

class ReviewCardListView extends StatelessWidget {
  final CampingReviews reviewListData;
  final AnimationController animationController;
  final Animation animation;
  final VoidCallback callback;

  const ReviewCardListView(
      {Key key,
      this.reviewListData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: EdgeInsets.only(left: 4, right: 24, top: 8, bottom: 16),
              child: Container(
                width: 325,
                decoration: BoxDecoration(
                  color: AppTheme.getTheme().backgroundColor,
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
                  child: AspectRatio(
                    aspectRatio: 2.7,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.width >= 360
                                        ? 12
                                        : 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        reviewListData.date,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.grey.withOpacity(0.8)),
                                      ),
                                    ),
                                    Text(
                                      reviewListData.title,
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: StarRating(
                                                    allowHalfRating: true,
                                                    starCount: 5,
                                                    rating:
                                                        reviewListData.rating,
                                                    size: 20,
                                                    color: AppTheme.getTheme()
                                                        .primaryColor,
                                                    borderColor:
                                                        AppTheme.getTheme()
                                                            .primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    trimmedDescription(
                                        reviewListData.description),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: AppTheme.getTheme()
                                .primaryColor
                                .withOpacity(0.1),
                            onTap: () {
                              try {
                                callback();
                              } catch (e) {}
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget trimmedDescription(String description) {
  return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 70),
      child: new Text(
        description,
        style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
        softWrap: true,
        overflow: TextOverflow.fade,
      ));
}
