import 'package:flutter/material.dart';
import 'package:my_camping/models/camping.dart';
import 'package:my_camping/services/favoriteService.dart';

import '../../../utilities/appTheme.dart';
import '../../../utilities/sizeConfig.dart';

class CustomDetailAppBar extends StatefulWidget {
  final Camping camping;
  final bool isFavoriteC;
  CustomDetailAppBar({this.camping, this.isFavoriteC});

  @override
  _CustomDetailAppBarState createState() => _CustomDetailAppBarState();
}

class _CustomDetailAppBarState extends State<CustomDetailAppBar> {
  bool isFavoriteCamping;

  @override
  void initState() {
    super.initState();
    isFavoriteCamping = widget.isFavoriteC;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              // ignore: deprecated_member_use
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context, isFavoriteCamping ?? widget.isFavoriteC),
                  child: Icon(Icons.arrow_back)),
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      onPressed: () {}, //condivisione
                      child: Icon(
                        Icons.share,
                        color: AppTheme.getTheme().primaryColor,
                      ),
                    )),
                const SizedBox(width: 5),
                SizedBox(
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        if (isFavoriteCamping) {
                          await FavoriteService.removeInFavoriteList(
                              widget.camping.cid);
                              setState(() {
                                isFavoriteCamping = false;
                              });

                        } else {
                          await FavoriteService.addInFavoriteList(
                              widget.camping);
                              setState(() {
                                isFavoriteCamping = true;
                              });
                        }
                      },
                      child: Icon(
                        isFavoriteCamping
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppTheme.getTheme().primaryColor,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
