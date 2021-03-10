import 'package:flutter/material.dart';

import '../../../appTheme.dart';
import 'calendarView.dart';

class Calendar extends StatefulWidget {
  final DateTime minimumDate;
  final DateTime maximumDate;
   final DateTime date;
  final Function(DateTime) onApplyClick;
  const Calendar({Key key, this.date, this.minimumDate, this.maximumDate, this.onApplyClick}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin{
  AnimationController animationController;
  DateTime _date;

  @override
  void initState() {
     animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    if(widget.date != null){
      _date=widget.date;
    }
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: AppTheme.isLightTheme
            ? Colors.transparent
            : AppTheme.getTheme().backgroundColor.withOpacity(0.6),
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: animationController.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  //if (widget.barrierDismissible) Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.getTheme().backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.getTheme().dividerColor,
                              offset: Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CalendarView(
                              minimumDate: widget.minimumDate,
                              maximumDate: widget.maximumDate,
                              date: widget.date,
                              dateChange: (DateTime dateData) {
                                setState(() {
                                  _date = dateData;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppTheme.getTheme().primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      try {
                                        widget.onApplyClick(_date);
                                        Navigator.pop(context);
                                      } catch (e) {}
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
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      ),
            );
  }
}