import 'package:equatable/equatable.dart';

class PitchAvailableDate extends Equatable {
  final String avid;
  final String startDate;
  final String endDate;

  PitchAvailableDate({this.avid, this.startDate, this.endDate});

  @override
  List<Object> get props => [
        avid,
        startDate,
        endDate,
      ];

  factory PitchAvailableDate.fromJson(Map<String, dynamic> json) =>
      PitchAvailableDate(
        avid: json['avid'],
        startDate: json['startDate'],
        endDate: json['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'avid': avid,
        'startDate': startDate,
        'endDate': endDate,
      };
}
