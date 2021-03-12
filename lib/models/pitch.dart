import 'package:equatable/equatable.dart';

import 'pitchAvailableDate.dart';

class Pitch extends Equatable {
  final String type;
  final String price;
  final int firstSize;
  final int secondSize;
  final int totalAvailable;
  final int totalQuantity;
  final PitchAvailableDate availableDate;

  Pitch(
      {this.type,
      this.price,
      this.firstSize,
      this.secondSize,
      this.totalAvailable,
      this.totalQuantity,
      this.availableDate});

  @override
  List<Object> get props => [
        type,
        price,
        firstSize,
        secondSize,
        totalAvailable,
        totalQuantity,
        availableDate,
      ];

  factory Pitch.fromJson(Map<String, dynamic> json) => Pitch(
        type: json['type'],
        price: json['price'],
        firstSize: json['firstSize'],
        secondSize: json['secondSize'],
        totalAvailable: json['totalAvailable'],
        totalQuantity: json['totalQuantity'],
        availableDate : PitchAvailableDate.fromJson(json['availableDate']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
        'firstSize': firstSize,
        'secondSize': secondSize,
        'totalAvailable': totalAvailable,
        'totalQuantity': totalQuantity,
        'availableDate': availableDate.toJson(),
      };
}
