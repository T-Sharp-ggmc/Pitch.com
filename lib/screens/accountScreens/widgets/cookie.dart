
import 'package:my_camping/models/privacySelectionList.dart';
import 'package:flutter/material.dart';

import '../../../appTheme.dart';
import '../../../sizeConfig.dart';

class Cookie extends StatefulWidget {
  final PrivacySelectionListData data;
  //final VoidCallback callback;

  const Cookie({Key key, this.data}) : super(key: key);

  @override
  _CookieState createState() => _CookieState();
}

class _CookieState extends State<Cookie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: getProportionateScreenHeight(50),
                  child: Text(
                    widget.data.titleTxt,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      height: getProportionateScreenHeight(70),
                      width: getProportionateScreenWidth(260),
                      child: Text(
                        widget.data.subTxt,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: IconButton(
                      icon: widget.data.isSelected
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      onPressed: () {
                        setState(() {
                          widget.data.isSelected = !widget.data.isSelected;
                        });
                      },
                      color: widget.data.isSelected
                          ? AppTheme.getTheme().primaryColor
                          : AppTheme.getTheme().disabledColor,
                    ),
                  )
                ],
              ),
              Container(
                  height: getProportionateScreenHeight(15),
                  child: Text(
                    "Scopri di più",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.getTheme().primaryColor,
                    ),
                  )),
            ],
          )),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Divider(
          color: AppTheme.getTheme().dividerColor,
          height: 2,
        ),
      ],
    );
  }
}
