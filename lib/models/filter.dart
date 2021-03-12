import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final int uid;
  final List<String> categories;
  final String info;
  final double dist;
  final List<String> services;

  Filter( 
      {this.uid, this.categories, this.info, this.dist, this.services,});

  @override
  List<Object> get props => [
        uid,
        categories,
        info,
        dist,
        services,
      ];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'categories': categories,
        'info': info,
        'dist': dist,
        'services': services,
      };

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        uid: json['uid'],
        categories: json['categories'],
        info: json['info'],
        dist: convertIntToDouble(json['dist']),
        services: json['services'],
      );

  static double convertIntToDouble(num value){
    if(value is int)
      return value.toDouble();
    return value;
  }

}
