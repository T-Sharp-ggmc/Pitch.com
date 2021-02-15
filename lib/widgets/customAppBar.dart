import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String nameOfPage;
  final bool isDetailsPage;

  CustomAppBar({Key key, this.nameOfPage, this.isDetailsPage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Container(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
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
                    isDetailsPage
                        ? SizedBox(width: 0)
                        : Padding(
                            padding: const EdgeInsets.only(top: 8, left: 8),
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
            isDetailsPage
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      nameOfPage,
                      style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : SizedBox(height: 0),
          ],
        ),
      ],
    );
  }
}
