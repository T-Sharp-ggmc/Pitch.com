import 'package:my_camping/provider/premiumCampingProvider.dart';
import 'package:my_camping/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utilities/appTheme.dart';
import '../../../widgets/campingCard.dart';

class CampingList extends StatefulWidget {
  const CampingList({Key key}) : super(key: key);
  @override
  _CampingListState createState() => _CampingListState();
}

class _CampingListState extends State<CampingList>
    with TickerProviderStateMixin {
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
    return Stack(children: <Widget>[
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
              child: Stack(children: <Widget>[
                Consumer<PremiumCampingProvider>(
                    builder: (context, provider, _) {
                  if (provider.premiumCampings != null) {
                    if (provider.premiumCampings.length != 0) {
                      return Container(
                        color: AppTheme.getTheme().backgroundColor,
                        child: ListView.builder(
                          itemCount: provider.premiumCampings.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return CampingCardListView(
                              campingData: provider.premiumCampings[index],
                              callback: refresh,
                            );
                          },
                        ),
                      );
                    }
                    return Container(
                      height: 360,
                      child: SizedBox(),
                    );
                  } else {
                    return Loading();
                  }
                })
              ]),
            ),
          ],
        ),
      )
    ]);
  }

  refresh() {
    setState(() {});
  }
}
