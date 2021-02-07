class PopularFilterListData {
  String titleTxt;
  bool isSelected;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<PopularFilterListData> popularList = [
    PopularFilterListData(
      titleTxt: 'Tutto',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Bagno',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Lido',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Ristorante',
      isSelected: false,
    ),
  ];

  static List<PopularFilterListData> categoryList = [
    PopularFilterListData(
      titleTxt: 'Mare',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Lago',
      isSelected: false,
    ),
    PopularFilterListData(
      titleTxt: 'Montagna',
      isSelected: true,
    ),
  ];
}
