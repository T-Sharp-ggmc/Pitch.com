class PopularFilterListData {
  String titleTxt;
  bool isSelected;
  String imageUrl;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
    this.imageUrl = '',
  });

  static List<PopularFilterListData> popularList = [
    PopularFilterListData(titleTxt: 'Tutto', isSelected: false, imageUrl: ''),
    PopularFilterListData(
      titleTxt: 'Bagno',
      isSelected: false,
      imageUrl: '',
    ),
    PopularFilterListData(
      titleTxt: 'Lido',
      isSelected: true,
      imageUrl: '',
    ),
    PopularFilterListData(
      titleTxt: 'Ristorante',
      isSelected: false,
      imageUrl: '',
    ),
  ];

  static List<PopularFilterListData> categoryList = [
    PopularFilterListData(
      titleTxt: 'Mare',
      isSelected: false,
      imageUrl: 'assets/images/filters/mare.png',
    ),
    PopularFilterListData(
      titleTxt: 'Lago',
      isSelected: false,
      imageUrl: 'assets/images/filters/lago.png',
    ),
    PopularFilterListData(
      titleTxt: 'Montagna',
      isSelected: true,
      imageUrl: 'assets/images/filters/montagna.png',
    ),
    PopularFilterListData(
      titleTxt: 'Fiumi',
      isSelected: true,
      imageUrl: 'assets/images/filters/fiumi.png',
    ),
  ];
}
