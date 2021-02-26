import 'package:Pitch/models/account.dart';
import 'package:Pitch/screens/accountScreens/widgets/accountImage.dart';
import 'package:Pitch/screens/accountScreens/widgets/textToEdit.dart';
import 'package:flutter/material.dart';
import '../../widgets/customAppBar.dart';
import '../../appTheme.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  List<AccountInfo> accountInfoList = AccountInfo.accountInfoList;
  String newAccountInfo = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: CustomAppBar(nameOfPage: "Modifica Profilo"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 130,
                        height: 130,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            AccountImage(),
                            getCameraImage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                    itemCount: accountInfoList.length,
                    itemBuilder: (context, index) {
                      return TextToEdit(
                        accountInfo: accountInfoList[index],
                        callback: (newAccountInfo) {
                          setState(() {
                            accountInfoList[index].infoDescription =
                                newAccountInfo;
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCameraImage() {
    return Positioned(
      bottom: 6,
      right: 6,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.getTheme().primaryColor,
          shape: BoxShape.circle,
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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.camera_alt,
                color: AppTheme.getTheme().backgroundColor,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
