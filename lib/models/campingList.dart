import 'package:intl/intl.dart';

import 'popularFilterList.dart';

class CampingListDto {
  int id;
  List<String> imagePath;
  String name;
  String info;
  String date;
  String pitchSize;
  double dist;
  double rating;
  int reviews;
  int perDay;
  bool isFavorite;
  bool isSelected; //da sfruttare nella mappa
  int numOfBooking;
  CampingCategory category;

  CampingListDto(
      {this.id = 0,
      this.imagePath,
      this.name = "",
      this.info = "",
      this.date = '',
      this.pitchSize = "",
      this.dist = 1.8,
      this.rating = 4.5,
      this.reviews = 80,
      this.perDay = 200,
      this.isFavorite = false,
      this.isSelected = false,
      this.numOfBooking = 20,
      this.category = CampingCategory.none});

  static List<CampingListDto> campingList = [
    CampingListDto(
        id: 1,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "Baia degli Aranci",
        info: "Vieste, FG",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 2 Adulti",
        dist: 2.0,
        rating: 3.5,
        reviews: 120,
        perDay: 100,
        isFavorite: true,
        isSelected: true,
        numOfBooking: 40,
        category: CampingCategory.mare),
    CampingListDto(
        id: 2,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "Baia degli Arancioni",
        info: "Peschici, FG",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 4 Adulti",
        dist: 2.0,
        rating: 4.5,
        reviews: 120,
        perDay: 60,
        isFavorite: false,
        isSelected: false,
        numOfBooking: 20,
        category: CampingCategory.lago)
  ];


  static List<CampingListDto> premiumList = [
    CampingListDto(
        id: 1,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "Grand Royal Hotel",
        info: "Wembley, London",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 2 Adulti",
        dist: 2.0,
        rating: 4.4,
        reviews: 80,
        perDay: 180,
        isFavorite: false,
        isSelected: true,
        numOfBooking: 40,
        category: CampingCategory.mare),

        CampingListDto(
        id: 1,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "mtc",
        info: "Wembley, London",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 2 Adulti",
        dist: 2.0,
        rating: 4.4,
        reviews: 80,
        perDay: 180,
        isFavorite: false,
        isSelected: true,
        numOfBooking: 40,
        category: CampingCategory.fiume),

        CampingListDto(
        id: 1,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "caspiterina",
        info: "Wembley, London",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 2 Adulti",
        dist: 2.0,
        rating: 4.4,
        reviews: 80,
        perDay: 180,
        isFavorite: false,
        isSelected: true,
        numOfBooking: 40,
        category: CampingCategory.montagna),

        CampingListDto(
        id: 1,
        imagePath: ['assets/images/TopPlace/camping_1.jpg', 'assets/images/TopPlace/camping_2.jpg', 'assets/images/TopPlace/camping_3.jpg'],
        name: "mimi",
        info: "Wembley, London",
        date:
            '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
        pitchSize: "1 Piazzola - 2 Adulti",
        dist: 2.0,
        rating: 4.4,
        reviews: 80,
        perDay: 180,
        isFavorite: false,
        isSelected: true,
        numOfBooking: 40,
        category: CampingCategory.none),
        
  ];
}
