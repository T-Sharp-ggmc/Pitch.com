import 'package:intl/intl.dart';

class CampingListDto {
  String imagePath;
  String name;
  String info;
  String date;
  String pitchSize;
  double dist;
  double rating;
  int reviews;
  int perDay;
  bool isFavorite;
  bool isSelected;
  String type;
  //da sfruttare nella mappa

  CampingListDto(
      {this.imagePath = '',
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
      this.type = ""});

  static List<CampingListDto> campingList = [
    CampingListDto(
      imagePath: 'assets/images/TopPlace/camping_1.jpg',
      name: "Baia degli Aranci",
      info: "Vieste, FG",
      date:
          '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
      pitchSize: "1 Piazzola - 2 Adulti",
      dist: 2.0,
      rating: 3.5,
      reviews: 120,
      perDay: 60,
      isFavorite: true,
      isSelected: true,
      type: 'Mare',
    ),
    CampingListDto(
      imagePath: 'assets/images/TopPlace/camping_1.jpg',
      name: "Baia degli Aranci",
      info: "Vieste, FG",
      date:
          '${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 2)))} - ${DateFormat("dd MMM").format(DateTime.now().add(Duration(days: 8)))}',
      pitchSize: "1 Piazzola - 2 Adulti",
      dist: 2.0,
      rating: 3.5,
      reviews: 120,
      perDay: 60,
      isFavorite: false,
      isSelected: false,
    )
  ];
}
