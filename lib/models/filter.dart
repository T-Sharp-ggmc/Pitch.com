import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_camping/utilities/enum.dart';

class Filter extends Equatable {
  final int uid;
  final List<CampingCategory> categories;
  final double dist;
  final List<String> services;
  final List<String> date;
  final int numOfPitch;
  final int numOfAdults;
  final int numOfChild;
  final RangeValues priceRange;

  Filter({
    this.uid,
    this.categories,
    this.dist,
    this.services,
    this.date,
    this.numOfPitch,
    this.numOfAdults,
    this.numOfChild,
    this.priceRange,
  });

  @override
  List<Object> get props => [
        uid,
        categories,
        dist,
        services,
        date,
        numOfPitch,
        numOfAdults,
        numOfChild,
        priceRange,
      ];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'categories': categories,
        'dist': dist,
        'services': services,
        'date': date,
        'numOfPitch': numOfPitch,
        'numOfAdults': numOfAdults,
        'numOfChild': numOfChild,
        'priceRange': priceRange,
      };

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        uid: json['uid'],
        categories: json['categories'],
        dist: convertIntToDouble(json['dist']),
        services: json['services'],
        date: json['date'],
        numOfPitch: json['numOfPitch'],
        numOfAdults: json['numOfAdults'],
        numOfChild: json['numOfChild'],
        priceRange: json['priceRange'],
      );

  static double convertIntToDouble(num value) {
    if (value is int) return value.toDouble();
    return value;
  }
}
