import 'package:my_camping/models/filter.dart';
import 'package:my_camping/utilities/appTheme.dart';
import 'package:my_camping/provider/campingProvider.dart';
import 'package:my_camping/utilities/enum.dart';
import 'package:my_camping/widgets/campingCard.dart';
import 'package:my_camping/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../models/filtersList.dart';
import 'filtersScreen.dart';
import 'popups/calendarPopup.dart';
import 'popups/pitchPopup.dart';
import 'popups/orderPopup.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";

  const SearchScreen({Key key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  Filter filters;
  List<FilterListData> serviceListData = FilterListData.serviceList;
  List<FilterListData> categoryListData = FilterListData.categoryList;
  int pitchSearch = 0;
  int adSearch = 0;
  int chSearch = 0;
  DateTime startDate;
  DateTime endDate;
  RangeValues priceRangeSelected = RangeValues(0, 1000);
  double distance = 100.00;
  bool isFilterApplied = false;

  OrderType _selectedOrder = OrderType.noOrder;

  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CampingProvider>(context).loadCamping(_selectedOrder, filters);
    return Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Ricerca"),
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
                            Consumer<CampingProvider>(
                                builder: (context, provider, _) {
                              if (provider.campings != null) {
                                int campingListLenght =
                                    provider.campings.length;
                                if (provider.keyword == "") {
                                  return Container(
                                    color: AppTheme.getTheme().backgroundColor,
                                    child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: campingListLenght,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        var count = campingListLenght > 10
                                            ? 10
                                            : campingListLenght;
                                        return CampingCardListView(
                                          campingData: provider.campings[index],
                                          callback: refresh,
                                        );
                                      },
                                    ),
                                  );
                                } else if (provider.searchedCampings.length !=
                                    0) {
                                  return Container(
                                    color: AppTheme.getTheme().backgroundColor,
                                    child: ListView.builder(
                                      controller: scrollController,
                                      itemCount:
                                          provider.searchedCampings.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        var count = campingListLenght > 10
                                            ? 10
                                            : campingListLenght;
                                        return CampingCardListView(
                                          campingData:
                                              provider.searchedCampings[index],
                                          callback: refresh,
                                        );
                                      },
                                    ),
                                  );
                                }
                                return Loading();
                              } else
                                return Loading();
                            })
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

  String setTextA() {
    if (this.adSearch == 0 || this.adSearch > 1) {
      return "Adulti";
    }
    return "Adulto";
  }

  String setTextP() {
    if (this.pitchSearch == 0 || this.pitchSearch > 1) {
      return "Piazzole";
    }
    return "Piazzola";
  }

  void applyFilters() {
    // get all category selected
    List<CampingCategory> cat = <CampingCategory>[];
    if (categoryListData.isNotEmpty) {
      for (var i = 0; i < categoryListData.length; i++) {
        if (categoryListData[i].isSelected)
          cat.add(categoryListData[i].category);
      }
    }

    // get all service selected
    List<String> serv = <String>[];
    if (serviceListData.isNotEmpty) {
      for (var i = 0; i < serviceListData.length; i++) {
        if (serviceListData[i].isSelected)
          serv.add(serviceListData[i].titleTxt.toLowerCase());
      }
    }

    //convert date range in list of string
    List<String> listOfDate = [];
    if (!(this.startDate == null || this.endDate == null))
      listOfDate = getDaysInBeteween(this.startDate, this.endDate);

    this.filters = new Filter(
      categories: cat,
      dist: this.distance,
      services: serv,
      date: listOfDate,
      numOfPitch: this.pitchSearch,
      numOfAdults: this.adSearch,
      numOfChild: this.chSearch,
      priceRange: this.priceRangeSelected,
    );
  }

  List<String> getDaysInBeteween(DateTime startDate, DateTime endDate) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String dateFormatted;
    List<String> days = [];
    DateTime start = startDate;
    dateFormatted = formatter.format(start);
    days.add(dateFormatted);

    for (int i = 1; i <= endDate.difference(startDate).inDays; i++) {
      start = start.add(Duration(days: 1));
      dateFormatted = formatter.format(start);
      days.add(dateFormatted);
    }
    return days;
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
                    child: Consumer<CampingProvider>(
                      builder: (context, provider, _) => TextField(
                        onChanged: (val) {
                          provider.searchCamping(val);
                        },
                        onTap: () {},
                        style: TextStyle(fontSize: 16),
                        cursorColor: AppTheme.getTheme().primaryColor,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Dove vuoi andare?",
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTimeDateUI() {
    String textP = setTextP();
    String textA = setTextA();
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
                            startDate == null && endDate == null
                                ? "Data inizio - Data fine"
                                : "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
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
                            "$pitchSearch $textP - $adSearch $textA",
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
                                distValue: distance,
                                isVisible: isFilterApplied,
                                onApplyChanges:
                                    (catList, serList, priceR, dist, vis) {
                                  setState(() {
                                    if (catList.isNotEmpty)
                                      categoryListData = catList;
                                    if (serList.isNotEmpty)
                                      serviceListData = serList;
                                    priceRangeSelected = priceR;
                                    distance = dist;
                                    isFilterApplied = vis;
                                  });
                                  applyFilters();
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
                            child: Icon(FontAwesomeIcons.mapMarkedAlt,
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
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
