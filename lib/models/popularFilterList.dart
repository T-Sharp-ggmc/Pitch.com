enum CampingCategory{
  none,
  mare,
  lago,
  montagna
}

class FilterListData {
  String titleTxt;
  bool isSelected;
  CampingCategory category;

  FilterListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.category= CampingCategory.none
  });

  static List<FilterListData> serviceList = [
    FilterListData(
      titleTxt: 'Tutto',
      isSelected: false,
    ),
    FilterListData(
      titleTxt: 'Bagno',
      isSelected: false,
    ),
    FilterListData(
      titleTxt: 'Lido',
      isSelected: true,
    ),
    FilterListData(
      titleTxt: 'Ristorante',
      isSelected: false,
    ),
  ];

  static List<FilterListData> categoryList = [
    FilterListData(
      category: CampingCategory.mare,
      titleTxt: 'Mare',
      isSelected: false,
    ),
    FilterListData(
      category: CampingCategory.lago,
      titleTxt: 'Lago',
      isSelected: false,
    ),
    FilterListData(
      category: CampingCategory.montagna,
      titleTxt: 'Montagna',
      isSelected: false,
    ),
  ];
}
