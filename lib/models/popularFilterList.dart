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
      titleTxt: 'Bagno',
      isSelected: false,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Lido',
      isSelected: true,
      imageUrl: '',
    ),
    FilterListData(
      titleTxt: 'Ristorante',
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
      isSelected: true,
      imageUrl: 'assets/images/filters/montagna.png',
    ),
    FilterListData(
      category: CampingCategory.fiume,
      titleTxt: 'Fiumi',
      isSelected: true,
      imageUrl: 'assets/images/filters/fiumi.png',
    ),
  ];
}
