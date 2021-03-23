import 'package:flutter/material.dart';
import 'package:my_camping/models/campingReviews.dart';
import 'package:my_camping/services/reviewService.dart';

class ReviewProvider extends ChangeNotifier {
  List<CampingReviews> _campingReviews;

  List<CampingReviews> get campingReviews => _campingReviews;

  void loadCampingReviews(String cid) async {
    _campingReviews = await ReviewService.getCampingReviews(cid);

    notifyListeners();
  }
}
