import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_camping/utilities/enum.dart';

class FilterListData {
  String titleTxt;
  bool isSelected;
  String imageUrl;
  IconData icon;
  CampingCategory category;

  FilterListData(
      {this.titleTxt = '',
      this.isSelected = false,
      this.imageUrl = '',
      this.icon = Icons.room_service,
      this.category = CampingCategory.none});

  static List<FilterListData> serviceList = [
    FilterListData(titleTxt: 'Tutto', isSelected: false, imageUrl: ''),
    FilterListData(
      titleTxt: 'WC',
      isSelected: false,
      imageUrl: '',
      icon: Icons.wc,
    ),
    FilterListData(
      titleTxt: 'Parcheggio gratuito',
      isSelected: false,
      imageUrl: '',
      icon: Icons.local_parking,
    ),
    FilterListData(
      titleTxt: 'Ristorante',
      isSelected: false,
      imageUrl: '',
      icon: Icons.restaurant,
    ),
    FilterListData(
      titleTxt: 'Wi-Fi',
      isSelected: false,
      imageUrl: '',
      icon: Icons.wifi,
    ),
    FilterListData(
      titleTxt: 'Accesso disabili',
      isSelected: false,
      imageUrl: '',
      icon: Icons.accessible,
    ),
    FilterListData(
      titleTxt: 'Animali ammessi',
      isSelected: false,
      imageUrl: '',
      icon: FontAwesomeIcons.dog,
    ),
    FilterListData(
      titleTxt: 'Piscina esterna',
      isSelected: false,
      imageUrl: '',
      icon: Icons.pool,
    ),
    FilterListData(
      titleTxt: 'Aria condizionata',
      isSelected: false,
      imageUrl: '',
      icon: FontAwesomeIcons.fan,
    ),
    FilterListData(
      titleTxt: 'Accesso alla spiaggia',
      isSelected: false,
      imageUrl: '',
      icon: Icons.beach_access,
    ),
  ];

  static List<FilterListData> categoryList = [
    FilterListData(
      category: CampingCategory.mare,
      titleTxt: 'Mare',
      isSelected: false,
      imageUrl: 'assets/images/filters/mare.png',
    ),
    FilterListData(
      category: CampingCategory.lago,
      titleTxt: 'Lago',
      isSelected: false,
      imageUrl: 'assets/images/filters/lago.png',
    ),
    FilterListData(
      category: CampingCategory.montagna,
      titleTxt: 'Montagna',
      isSelected: false,
      imageUrl: 'assets/images/filters/montagna.png',
    ),
    FilterListData(
      category: CampingCategory.fiume,
      titleTxt: 'Fiume',
      isSelected: false,
      imageUrl: 'assets/images/filters/fiumi.png',
    ),
  ];
}
