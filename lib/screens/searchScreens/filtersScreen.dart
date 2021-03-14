import 'package:my_camping/models/popularFilterList.dart';
import 'package:my_camping/widgets/customAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/appTheme.dart';
import 'widgets/RangeSliderView.dart';
import 'widgets/SliderView.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filter";
  final List<FilterListData> serviceListDto;
  final List<FilterListData> categoryListDto;
  final RangeValues priceRange;
  final double distValue;
  final Function(List<FilterListData>, List<FilterListData>, RangeValues, double)
      onApplyChanges;

  const FiltersScreen(
      {Key key,
      this.serviceListDto,
      this.categoryListDto,
      this.priceRange,
      this.distValue,
      this.onApplyChanges}) 
      : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  double _dist = 100.00;
  RangeValues _rang = RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.getTheme().backgroundColor,
      child: Scaffold(
        appBar: NewCustomAppBar(nameOfPage: "Filtri"),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: <Widget>[
                      priceBarFilter(),
                      Divider(
                        height: 1,
                      ),
                      categoryListUI(),
                      Divider(
                        height: 1,
                      ),
                      distanceViewUI(),
                      Divider(
                        height: 1,
                      ),
                      popularListUI()
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16 + MediaQuery.of(context).padding.bottom,
                  top: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.getTheme().primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.getTheme().dividerColor,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      widget.onApplyChanges(widget.categoryListDto,
                          widget.serviceListDto, _rang, _dist);
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Applica",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryListUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Categorie",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getCList(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getCList() {
    List<Widget> noList = <Widget>[];
    var count = 0;
    final columnCount = 2;
    for (var i = 0; i < widget.categoryListDto.length / columnCount; i++) {
      List<Widget> listUI = <Widget>[];
      for (var i = 0; i < columnCount; i++) {
        try {
          final cat = widget.categoryListDto[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {
                      setState(() {
                        cat.isSelected = !cat.isSelected;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            cat.isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: cat.isSelected
                                ? AppTheme.getTheme().primaryColor
                                : Colors.grey.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(cat.titleTxt),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ));
          count++;
        } catch (e) {
          print(e);
        }
      }
      noList.add(Row(
        children: listUI,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      ));
    }
    return noList;
  }

  Widget popularListUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Servizi offerti",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getPopularListUI(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getPopularListUI() {
    List<Widget> noList = <Widget>[];
    for (var i = 0; i < widget.serviceListDto.length; i++) {
      final date = widget.serviceListDto[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      date.titleTxt,
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? AppTheme.getTheme().primaryColor
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (widget.serviceListDto[0].isSelected) {
        widget.serviceListDto.forEach((d) {
          d.isSelected = false;
        });
      } else {
        widget.serviceListDto.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      widget.serviceListDto[index].isSelected =
          !widget.serviceListDto[index].isSelected;

      var count = 0;
      for (var i = 0; i < widget.serviceListDto.length; i++) {
        if (i != 0) {
          var data = widget.serviceListDto[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == widget.serviceListDto.length - 1) {
        widget.serviceListDto[0].isSelected = true;
      } else {
        widget.serviceListDto[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    _dist = widget.distValue;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Distanza dalla città più vicina",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: _dist,
          onChnagedistValue: (value) {
            _dist = value;
          },
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget priceBarFilter() {
    _rang = widget.priceRange;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Prezzo",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          values: _rang,
          onChnageRangeValues: (values) {
            _rang = values;
          },
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
