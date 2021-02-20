import 'package:Pitch/appTheme.dart';
import 'package:Pitch/models/campingList.dart';
import 'package:Pitch/screens/popups/orderPopup.dart';
import 'package:Pitch/widgets/campingCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../models/popularFilterList.dart';
import 'filtersScreen.dart';
import '../popups/calendarPopup.dart';
import '../popups/pitchPopup.dart';

class SearchPage extends StatefulWidget {
  final AnimationController animationController;

  const SearchPage({Key key, this.animationController}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  var campingList = CampingListDto.campingList;

  List<FilterListData> serviceListData = FilterListData.serviceList;
  List<FilterListData> categoryListData = FilterListData.categoryList;
  RangeValues priceRangeSelected = RangeValues(0, 1000);

  int pitchSearch = 1;
  int adSearch = 2;
  int chSearch = 0;
  OrderType _selectedOrder = OrderType.noOrder;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 5));
  bool showMap = false;
  final searchBarHeight = 158.0;

  //controller
  AnimationController animationController;
  //AnimationController _animationController;
  ScrollController scrollController = new ScrollController();

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

  @override
  void dispose() {
    animationController.dispose();
    //_animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        body: Stack(
          children: <Widget>[
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
                        Container(
                          color: AppTheme.getTheme().scaffoldBackgroundColor,
                          child: Column(
                            children: <Widget>[
                              getSearchBarUI(),
                              getTimeDateUI(),
                              getFilterBarUI(),
                            ],
                          ),
                        ),
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
                                  var animation = Tween(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
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
          ],
        ));
  }

// do not use!
  List<CampingListDto> filterListApply(List<CampingListDto> listToFilter) {
    bool isToRemove = false;
    bool isInSelectedCategory = false;
    List<FilterListData> categoryList =
        categoryListData.where((element) => element.isSelected).toList();
    List<CampingCategory> categorySelectedList = new List<CampingCategory>();
    List<CampingListDto> filteredList = listToFilter;

    for (var i = 0; i < categoryList.length; i++) {
      categorySelectedList.add(categoryList[i].category);
    }
    List<int> index = new List<int>();

    for (var x = 0; x < filteredList.length; x++) {
      //filter price
      if (filteredList[x].perDay < priceRangeSelected.start ||
          filteredList[x].perDay > priceRangeSelected.end) isToRemove = true;

      //filter category
      if (categorySelectedList.isNotEmpty) {
        isInSelectedCategory = false;
        for (var i = 0; i < categorySelectedList.length; i++) {
          if (filteredList[x].category == categorySelectedList[i])
            isInSelectedCategory = true;
        }

        if (!isInSelectedCategory) isToRemove = true;
      }

      //filter service

      //filter distance

      if (isToRemove) index.add(filteredList[x].id);
    }

    //remove items
    if (index.isNotEmpty) {
      for (var i = 0; i < index.length; i++) {
        for (var j = 0; j < filteredList.length; j++) {
          if (filteredList[j].id == index[i]) {
            filteredList.remove(filteredList[j]);
            //break;
          }
        }
      }
    }

    return filteredList;
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

  refresh() {
    setState(() {});
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.getTheme().backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular((38.0))),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.getTheme().dividerColor,
                        offset: Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (String
                        txt) {}, // funzione per aggiornare automaticamente la lista di campeggi che compare sotto
                    onTap: () {},
                    style: TextStyle(fontSize: 16),
                    cursorColor: AppTheme.getTheme().primaryColor,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Cerca",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // setState(() {
                      //   isDatePopupOpen = true;
                      // });
                      showDemoDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Scegli la data",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => PitchPopupView(
                          pitch: pitchSearch,
                          ad: adSearch,
                          ch: chSearch,
                          barrierDismissible: true,
                          onChnage: (pi, a, c) {
                            setState(() {
                              pitchSearch = pi;
                              adSearch = a;
                              chSearch = c;
                            });
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Numero di Piazzole",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "$pitchSearch Piazzole - $adSearch Adulti",
                            // "$pitch Piazzola - $ad Adulti",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFilterBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FiltersScreen(
                                serviceListDto: serviceListData,
                                categoryListDto: categoryListData,
                                priceRange: priceRangeSelected,
                                onApplyChanges: (catList, serList, priceR) {
                                  setState(() {
                                    categoryListData = catList;
                                    serviceListData = serList;
                                    priceRangeSelected = priceR;
                                  });
                                },
                              ),
                          fullscreenDialog: true),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Filtri",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.sort,
                              color: AppTheme.getTheme().primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      //Abilita view mappa
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Mappa",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                                showMap
                                    ? Icons.sort
                                    : FontAwesomeIcons.mapMarkedAlt,
                                color: AppTheme.getTheme().primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => OrderPopupView(
                          orderType: _selectedOrder,
                          onChange: (selOrd) {
                            setState(() {
                              _selectedOrder = selOrd;
                            });
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Ordina",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FontAwesomeIcons.sort,
                                color: AppTheme.getTheme().primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDemoDialog({BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            if (startData != null && endData != null) {
              startDate = startData;
              endDate = endData;
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
