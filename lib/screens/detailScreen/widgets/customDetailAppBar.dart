import 'package:flutter/material.dart';

import '../../../utilities/appTheme.dart';
import '../../../utilities/sizeConfig.dart';

class CustomDetailAppBar extends PreferredSize {
  final bool isFavoriteCamping;

  CustomDetailAppBar(this.isFavoriteCamping);
  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

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
                  onPressed: () => Navigator.pop(context),
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
                      onPressed: () {}, //set favorite
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
