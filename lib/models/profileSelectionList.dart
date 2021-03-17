import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsListData {
  String titleTxt;
  String subTxt;
  IconData iconData;
  bool isSelected;

  SettingsListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.subTxt = '',
    this.iconData = Icons.supervised_user_circle,
  });

  static List<SettingsListData> userSettingsList = [
    SettingsListData(
      titleTxt: 'Modifica profilo',
      isSelected: false,
      iconData: FontAwesomeIcons.userEdit,
    ),
    SettingsListData(
      titleTxt: 'Cambia password',
      isSelected: false,
      iconData: FontAwesomeIcons.lock,
    ),
    SettingsListData(
      titleTxt: 'Metodo di Pagamento',
      isSelected: false,
      iconData: FontAwesomeIcons.wallet,
    ),
    SettingsListData(
      titleTxt: 'Recensioni',
      isSelected: false,
      iconData: FontAwesomeIcons.comment,
    ),
    SettingsListData(
      titleTxt: 'Aiuto',
      isSelected: false,
      iconData: FontAwesomeIcons.infoCircle,
    ),
    SettingsListData(
      titleTxt: 'Invita amici',
      isSelected: false,
      iconData: FontAwesomeIcons.userFriends,
    ),
    SettingsListData(
      titleTxt: 'Le tue prenotazioni',
      isSelected: false,
      iconData: FontAwesomeIcons.barcode,
    ),
    SettingsListData(
      titleTxt: 'Termini di servizio',
      isSelected: false,
      iconData: null,
    ),
    SettingsListData(
      titleTxt: 'Impostazioni sulla privacy',
      isSelected: false,
      iconData: null,
    ),
    SettingsListData(
      titleTxt: 'Informazioni su Pitch',
      isSelected: false,
      iconData: null,
    ),
  ];
}

class Language {
  int value;
  String name;

  Language({
    this.value = 0,
    this.name = "",
  });

  static List<Language> languageList = [
    Language(
      value : 1,
      name : "Italiano",
    ),
    Language(
      value : 2,
      name : "Inglese",
    ),
    Language(
      value : 3,
      name : "Spagnolo",
    ),
    Language(
      value : 4,
      name : "Tedesco",
    ),
    Language(
      value : 5,
      name : "Cinese",
    ),
    Language(
      value : 6,
      name : "Olandese",
    ),
  ];
}

class Currency {
  int value;
  String name;

  Currency({
    this.value = 0,
    this.name = "",
  });

  static List<Currency> currencyList = [
    Currency(
      value : 1,
      name : "Euro",
    ),
    Currency(
      value : 2,
      name : "Sterlina",
    ),
    Currency(
      value : 3,
      name : "Dollaro",
    ),
    Currency(
      value : 4,
      name : "Yen",
    ),
  ];
}

class Unit {
  int value;
  String name;

  Unit({
    this.value = 0,
    this.name = "",
  });

  static List<Unit> unitList = [
    Unit(
      value : 1,
      name : "Km",
    ),
    Unit(
      value : 2,
      name : "Miglia",
    ),
  ];
}