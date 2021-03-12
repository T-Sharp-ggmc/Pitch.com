import 'package:equatable/equatable.dart';

import 'campingCoordinate.dart';
import 'pitch.dart';

class Camping extends Equatable {
  final int cid;
  final String name;
  final String info;
  final String city;
  final String category;
  final double rating;
  final int reviews;
  final int numOfBooking;
  final bool isPremium;
  final List<String> photos;
  final List<String> services;
  final List<Pitch> campingPitch;
  final CampingCoordinate position;

  Camping(
      {this.cid,
      this.name,
      this.info,
      this.city,
      this.category,
      this.rating,
      this.reviews,
      this.numOfBooking,
      this.isPremium,
      this.photos,
      this.services,
      this.campingPitch,
      this.position});

  @override
  List<Object> get props => [
        cid,
        name,
        info,
        city,
        category,
        rating,
        reviews,
        numOfBooking,
        isPremium,
        photos,
        services,
        campingPitch,
        position,
      ];

  Map<String, dynamic> toJson() => {
        'cid': cid,
        'name': name,
        'info': info,
        'city': city,
        'category': category,
        'rating': rating,
        'reviews': reviews,
        'numOfBooking': numOfBooking,
        'isPremium': isPremium,
        'photos': photos,
        'services': services,
        'campingPitch': campingPitch,
        'position': position,
      };

  factory Camping.fromJson(Map<String, dynamic> json) => Camping(
        cid: json['cid'],
        name: json['name'],
        info: json['info'],
        city: json['city'],
        category: json['category'],
        rating: json['rating'],
        reviews: json['reviews'],
        numOfBooking: json['numOfBooking'],
        isPremium: json['isPremium'],
        photos: json['photos'],
        services: json['services'],
        campingPitch: json['campingPitch'],
        position: json['position'],
      );

  static Pitch getLowestPrice(List<Pitch> pitch){
    if (pitch != null && pitch.isNotEmpty) {
      pitch.sort((a, b) => a.price.compareTo(b.price));
      return pitch.first;
    }
    return pitch.first;
  }
}
