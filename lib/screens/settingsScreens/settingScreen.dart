import 'package:Pitch/models/profileSelectionList.dart';
import 'package:flutter/material.dart';
import '../../appTheme.dart';
import '../../widgets/customAppBar.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = "/setting";
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<SettingsListData> appSettingsList = SettingsListData.appSettingsList;

  //per la lingua
  List<Language> languageList = Language.languageList;
  List<DropdownMenuItem<Language>> _languageDropDownMenuItems;
  Language _selectedLanguage;

  List<DropdownMenuItem<Language>> buildLanguageDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<Language>> items = [];
    for (Language listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  //per la valuta
  List<Currency> currencyList = Currency.currencyList;
  List<DropdownMenuItem<Currency>> _currentyDropDownMenuItems;
  Currency _selectedCurrency;

  List<DropdownMenuItem<Currency>> buildCurrencyDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<Currency>> items = [];
    for (Currency listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  //per l'unità
  List<Unit> unitList = Unit.unitList;
  List<DropdownMenuItem<Unit>> _unitDropDownMenuItems;
  Unit _selectedUnit;

  List<DropdownMenuItem<Unit>> buildUnitDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Unit>> items = [];
    for (Unit listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _languageDropDownMenuItems = buildLanguageDropDownMenuItems(languageList);
    _selectedLanguage = _languageDropDownMenuItems[0].value;

    _currentyDropDownMenuItems = buildCurrencyDropDownMenuItems(currencyList);
    _selectedCurrency = _currentyDropDownMenuItems[0].value;

    _unitDropDownMenuItems = buildUnitDropDownMenuItems(unitList);
    _selectedUnit = _unitDropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<Language>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Language>> items = [];
    for (Language listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewCustomAppBar(nameOfPage: "Impostazioni"),
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
            getTitleOfDropDown("Lingua"),
            getLanguageDropDownButton(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Divider(
                height: 2,
              ),
            ),
            getTitleOfDropDown("Valuta"),
            getCurrencyDropDownButton(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Divider(
                height: 2,
              ),
            ),
            getTitleOfDropDown("Unità"),
            getUnitDropDownButton(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Divider(
                height: 2,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  itemCount: appSettingsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // if (index == 0) {
                        //     Navigator.pushNamed(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => PrivacyScreen(),
                        //           fullscreenDialog: true,
                        //         ));
                        // }
                        // if (index == 1) {
                        //   Navigator.pushNamed(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => InfoScreen(),
                        //       fullscreenDialog: true,
                        //     ),
                        //   );
                        // }
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      appSettingsList[index].titleTxt,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Container(
                                    child: Icon(appSettingsList[index].iconData,
                                        color: AppTheme.getTheme()
                                            .disabledColor
                                            .withOpacity(0.3)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Divider(
                              height: 1,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getLanguageDropDownButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 22, right: 32),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Language>(
          value: _selectedLanguage,
          items: _languageDropDownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedLanguage = value;
            });
          },
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          iconEnabledColor: AppTheme.getTheme().disabledColor.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget getCurrencyDropDownButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 22, right: 32),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Currency>(
          value: _selectedCurrency,
          items: _currentyDropDownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedCurrency = value;
            });
          },
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          iconEnabledColor: AppTheme.getTheme().disabledColor.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget getUnitDropDownButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 22, right: 32),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Unit>(
          value: _selectedUnit,
          items: _unitDropDownMenuItems,
          onChanged: (value) {
            setState(() {
              _selectedUnit = value;
            });
          },
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          iconEnabledColor: AppTheme.getTheme().disabledColor.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget getTitleOfDropDown(String dropDownTitle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 22, top: 16),
      child: Text(
        dropDownTitle,
        style: TextStyle(
            fontSize: 12,
            color: AppTheme.getTheme().disabledColor.withOpacity(0.3)),
      ),
    );
  }
}
