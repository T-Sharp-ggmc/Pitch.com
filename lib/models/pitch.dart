import 'package:equatable/equatable.dart';

import 'pitchAvailableDate.dart';

class Pitch extends Equatable {
  final String type;
  final double price;
  final int firstSize;
  final int secondSize;
  final bool isAvailable;
  final List<PitchAvailableDate> availableDate;

  Pitch(
      {this.type,
      this.price,
      this.firstSize,
      this.secondSize,
      this.isAvailable,
      this.availableDate});

  @override
  List<Object> get props => [
        type,
        price,
        firstSize,
        secondSize,
        isAvailable,
        availableDate,
      ];

  factory Pitch.fromJson(Map<String, dynamic> json) => Pitch(
        type: json['type'],
        price: convertIntToDouble(json['price']),
        firstSize: json['firstSize'],
        secondSize: json['secondSize'],
        isAvailable: json['isAvailable'],
        availableDate : json['availableDate'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
        'firstSize': firstSize,
        'secondSize': secondSize,
        'isAvailable': isAvailable,
        'availableDate': availableDate,
      };

  
  static double convertIntToDouble(num value){
    if(value is int)
      return value.toDouble();
    return value;
  }
}
