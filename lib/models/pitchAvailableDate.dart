import 'package:equatable/equatable.dart';

class PitchAvailableDate extends Equatable {
  final String startDate;
  final String endDate;

  PitchAvailableDate({this.startDate, this.endDate});

  @override
  List<Object> get props => [
        startDate,
        endDate,
      ];

  factory PitchAvailableDate.fromJson(Map<String, dynamic> json) =>
      PitchAvailableDate(
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'startDate': startDate,
        'endDate': endDate,
      };
}
