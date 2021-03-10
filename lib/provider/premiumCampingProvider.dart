import 'package:my_camping/models/camping.dart';
import 'package:my_camping/services/campingService.dart';
import 'package:flutter/material.dart';

class PremiumCampingProvider extends ChangeNotifier {
  List<Camping> _premiumCampings;

  List<Camping> get premiumCampings => _premiumCampings;

  void loadPremiumCamping() async {
    _premiumCampings = await CampingService.getPremiumCamping();

    notifyListeners();
  }
}
