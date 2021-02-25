import 'package:Pitch/screens/popups/orderPopup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../appTheme.dart';
import '../models/campingList.dart';
import 'campingCard.dart';

class CampingList extends StatefulWidget {
  final AnimationController animationController;

  const CampingList({Key key, this.animationController}) : super(key: key);
  @override
  _CampingListState createState() => _CampingListState();
}

class _CampingListState extends State<CampingList>
    with TickerProviderStateMixin {
  var campingList = CampingListDto.campingList;
  OrderType _selectedOrder = OrderType.noOrder;
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(children: <Widget>[
                      Container(
                        color: AppTheme.getTheme().backgroundColor,
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: campingList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var count = campingList.length > 10
                                ? 10
                                : campingList.length;
                            campingList =
                                orderList(_selectedOrder, campingList);
                            var animation = Tween(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));

                            ///da capire
                            animationController.forward();
                            return CampingCardListView(
                              animation: animation,
                              animationController: animationController,
                              campingData: campingList[index],
                              callback: refresh,
                            );
                          },
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }

  refresh() {
    setState(() {});
  }

  AnimationController animationController;
  //AnimationController _animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    // _animationController = AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    // scrollController.addListener(() {
    //   if (context != null) {
    //     if (scrollController.offset <= 0) {
    //       _animationController.animateTo(0.0);
    //     } else if (scrollController.offset > 0.0 && scrollController.offset < searchBarHeight) {
    //       // we need around searchBarHieght scrolling values in 0.0 to 1.0
    //       _animationController.animateTo((scrollController.offset / searchBarHeight));
    //     } else {
    //       _animationController.animateTo(1.0);
    //     }
    //   }
    // });
    super.initState();
  }

  List<CampingListDto> orderList(
      OrderType orderType, List<CampingListDto> listToOrder) {
    switch (orderType) {
      case OrderType.priceCre:
        listToOrder.sort((a, b) => a.perDay.compareTo(b.perDay));
        break;
      case OrderType.priceDec:
        listToOrder.sort((b, a) => a.perDay.compareTo(b.perDay));
        break;
      case OrderType.avgRating:
        listToOrder.sort((b, a) => a.rating.compareTo(b.rating));
        break;
      case OrderType.popCamp:
        listToOrder.sort((b, a) => a.numOfBooking.compareTo(b.numOfBooking));
        break;
      default:
        listToOrder.sort((a, b) => a.name.compareTo(b.name));
    }
    return listToOrder;
  }
}
// class CampingList {
//   List<CampingListDto> premiumList = CampingListDto.premiumList;

//   List<Widget> getPosts() {
//     List<Widget> posts = [];
//     for (int i = 0; i < premiumList.length; i++) {
//       posts.add(getPost(i));
//     }
//     return posts;
//   }

//   Widget getPost(int index) {
//     return Padding(
//         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//         // child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               constraints: BoxConstraints.expand(height: 1),
//               color: Colors.grey,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(50.0)),
//               child: Stack(
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       AspectRatio(
//                         aspectRatio: 2,
//                         child: Image.asset(
//                           premiumList[index].imagePath,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Container(
//                         color: AppTheme.getTheme().backgroundColor,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 0, top: 0, bottom: 0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         premiumList[index].name,
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 22,
//                                         ),
//                                       ),
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: <Widget>[
//                                           Text(
//                                             premiumList[index].info,
//                                             style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.grey
//                                                     .withOpacity(0.8)),
//                                           ),
//                                           SizedBox(
//                                             width: 4,
//                                           ),
//                                           Icon(
//                                             FontAwesomeIcons.mapMarkerAlt,
//                                             size: 12,
//                                             color: AppTheme.getTheme()
//                                                 .primaryColor,
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               premiumList[index]
//                                                   .dist
//                                                   .toString(),
//                                               overflow: TextOverflow.ellipsis,
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.grey
//                                                       .withOpacity(0.8)),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 4),
//                                         child: Row(
//                                           children: <Widget>[
//                                             SmoothStarRating(
//                                               allowHalfRating: true,
//                                               starCount: 5,
//                                               size: 20,
//                                               color: AppTheme.getTheme()
//                                                   .primaryColor,
//                                               borderColor: AppTheme.getTheme()
//                                                   .primaryColor,
//                                             ),
//                                             Text(
//                                               'Stelle',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.grey
//                                                       .withOpacity(0.8)),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 0, top: 0),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                         onTap: () {
//                           premiumList[index].isFavorite =
//                               premiumList[index].isFavorite;
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: premiumList[index].isFavorite
//                               ? Icon(
//                                   Icons.favorite,
//                                   color: AppTheme.getTheme().primaryColor,
//                                 )
//                               : Icon(
//                                   Icons.favorite_border,
//                                   color: AppTheme.getTheme().primaryColor,
//                                 ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[],
//                 ),
//               ],
//             ),
//           ],
//         ) //)
//         );
//   }
// }
