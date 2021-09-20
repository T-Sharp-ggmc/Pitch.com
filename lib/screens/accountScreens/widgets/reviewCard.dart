import 'package:my_camping/models/reviewList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/appTheme.dart';
import '../../../widgets/starRating.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key key}) : super(key: key);

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  List<ReviewListData> myReviewList = ReviewListData.myReviewList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: myReviewList.length == 0
          ? noReviewList()
          : ListView.builder(
              itemCount: myReviewList.length,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ReviewCardListView(
                  callback: () {},
                  reviewListData: myReviewList[index],
                );
              },
            ),
    );
  }

  Widget noReviewList() {
    return Scaffold(
      backgroundColor: AppTheme.getTheme().backgroundColor,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Icon(
                      Icons.rate_review,
                      size: 50,
                      color: AppTheme.getTheme().primaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      "Non hai scritto nessuna recensione",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      "Dopo ogni soggiorno riceverai un invito a scrivere una recensione.\n In questo modo ci assicuriamo che le nostre recensioni provengano da ospiti veri, proprio come te.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewCardListView extends StatelessWidget {
  final ReviewListData reviewListData;
  final VoidCallback callback;

  const ReviewCardListView({Key key, this.reviewListData, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: Container(
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
                            MediaQuery.of(context).size.width >= 360 ? 12 : 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              reviewListData.nameOfCamping,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                              const EdgeInsets.only(top: 4),
                                          child: StarRating(
                                            allowHalfRating: true,
                                            starCount: 5,
                                            rating: reviewListData.rating,
                                            size: 20,
                                            color: AppTheme.getTheme()
                                                .primaryColor,
                                            borderColor: AppTheme.getTheme()
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
                            Text(
                              reviewListData.review,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.8)),
                            ),
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
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.1),
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
    );
  }
}
