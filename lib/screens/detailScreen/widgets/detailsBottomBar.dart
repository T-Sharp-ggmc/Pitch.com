import 'package:flutter/material.dart';

import '../../../appTheme.dart';
import '../../../sizeConfig.dart';

class DetailsBottomBar extends StatefulWidget {
  @override
  _DetailsBottomBarState createState() => _DetailsBottomBarState();
}

class _DetailsBottomBarState extends State<DetailsBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppTheme.getTheme().dividerColor,
            blurRadius: 10,
          ),
        ],
      ),
      height: getProportionateScreenHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24, bottom: 6),
              child: ListTile(
                title: Text(
                  "Totale",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
                subtitle: Text("60€ / notte"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 6),
              child: Container(
                height: getProportionateScreenHeight(40),
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
                      //Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Book now",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
