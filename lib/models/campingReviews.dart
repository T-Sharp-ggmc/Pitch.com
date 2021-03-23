import 'package:equatable/equatable.dart';

class CampingReviews extends Equatable {
  final String cid;
  final String title;
  final String description;
  final String date;
  final double rating;

  CampingReviews(
      {this.cid,
      this.title,
      this.description,
      this.date,
      this.rating,
      });

  @override
  List<Object> get props => [
        cid,
        title,
        description,
        date,
        rating,
      ];

  factory CampingReviews.fromJson(Map<String, dynamic> json) => CampingReviews(
        cid: json['cid'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        rating: convertIntToDouble(json['rating']),
      );

  Map<String, dynamic> toJson() => {
        'cid': cid,
        'title': title,
        'description': description,
        'date': date,
        'rating': rating,
      };

  
  static double convertIntToDouble(num value){
    if(value is int)
      return value.toDouble();
    return value;
  }
}
