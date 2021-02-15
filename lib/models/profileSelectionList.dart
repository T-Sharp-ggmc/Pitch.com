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
      titleTxt: 'Le mie prenotazioni',
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
  ];

}