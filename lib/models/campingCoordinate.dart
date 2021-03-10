import 'package:equatable/equatable.dart';

class CampingCoordinate extends Equatable {
  final String latitude;
  final String longitude;

  CampingCoordinate({this.latitude, this.longitude});

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];

  factory CampingCoordinate.fromJson(Map<String, dynamic> json) =>
      CampingCoordinate(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
