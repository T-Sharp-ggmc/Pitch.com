import 'package:my_camping/utilities/enum.dart';

class FilterListData {
  String titleTxt;
  bool isSelected;
  String imageUrl;
  CampingCategory category;

  FilterListData(
      {this.titleTxt = '',
      this.isSelected = false,
      this.imageUrl = '',
      this.category = CampingCategory.none});

  static List<FilterListData> serviceList = [
    FilterListData(titleTxt: 'Tutto', isSelected: false, imageUrl: ''),
    FilterListData(
      titleTxt: 'WC',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Parcheggio gratuito',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Ristorante',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Wi-Fi',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Accesso disabili',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Animali ammessi',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Piscina esterna',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Aria condizionata',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Accesso alla spiaggia',
      isSelected: false,
      imageUrl: '',
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
