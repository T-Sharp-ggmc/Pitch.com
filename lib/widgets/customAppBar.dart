import 'package:flutter/material.dart';

import '../sizeConfig.dart';

class NewCustomAppBar extends PreferredSize {
  final String nameOfPage;

  NewCustomAppBar({@required this.nameOfPage});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(10)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: SizedBox(
                  height: getProportionateScreenWidth(50),
                  width: getProportionateScreenWidth(40),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 8),
                child: Text(
                  nameOfPage,
                  style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


class SignCustomAppBar extends PreferredSize {
  final String nameOfPage;

  SignCustomAppBar({@required this.nameOfPage});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(10)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Center(
                  child: Text(
                    nameOfPage,
                    style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
