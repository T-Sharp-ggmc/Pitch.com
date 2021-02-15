import 'package:WeCanTry/models/helpSelectionList.dart';
import 'package:WeCanTry/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';

class HelpDetailsScreen extends StatefulWidget {
  final String title;

  const HelpDetailsScreen({Key key, this.title = ""}) : super(key: key);
  @override
  _HelpDetailsScreenState createState() => _HelpDetailsScreenState();
}

class _HelpDetailsScreenState extends State<HelpDetailsScreen> {
  List<HelpSelectionListData> subHelpList = HelpSelectionListData.subHelpList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 24),
                child: CustomAppBar(nameOfPage: widget.title, isDetailsPage: true,),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
                  itemCount: subHelpList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: subHelpList[index].isSelected ? () {} : null,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: subHelpList[index].titleTxt != ""
                                      ? Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            subHelpList[index].titleTxt,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 16),
                                          child: Container(
                                            child: Text(
                                              subHelpList[index].subTxt,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: subHelpList[index].isSelected
                                                    ? AppTheme.getTheme().primaryColor
                                                    : AppTheme.getTheme().disabledColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          subHelpList[index].isSelected
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                  child: Divider(
                                    height: 1,
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
