import 'package:equatable/equatable.dart';

class Pitch extends Equatable {
  final String type;
  final String price;
  final int firstSize;
  final int secondSize;
  final int totalAvailable;
  final int totalQuantity;

  Pitch(
      {this.type,
      this.price,
      this.firstSize,
      this.secondSize,
      this.totalAvailable,
      this.totalQuantity});

  @override
  List<Object> get props => [
        type,
        price,
        firstSize,
        secondSize,
        totalAvailable,
        totalQuantity,
      ];

  factory Pitch.fromJson(Map<String, dynamic> json) => Pitch(
        type: json['type'],
        price: json['price'],
        firstSize: json['firstSize'],
        secondSize: json['secondSize'],
        totalAvailable: json['totalAvailable'],
        totalQuantity: json['totalQuantity'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
        'firstSize': firstSize,
        'secondSize': secondSize,
        'totalAvailable': totalAvailable,
        'totalQuantity': totalQuantity,
      };
}
