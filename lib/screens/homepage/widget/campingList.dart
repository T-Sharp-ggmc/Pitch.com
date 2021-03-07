import 'package:Pitch/screens/popups/orderPopup.dart';
import 'package:flutter/material.dart';
import '../../../appTheme.dart';
import '../../../models/campingList.dart';
import '../../../widgets/campingCard.dart';

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
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
